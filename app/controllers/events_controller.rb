class EventsController < ApplicationController
  before_action :set_event, only: :show
  before_action :set_user_event, only: :destroy
  before_action :authenticate_user!, except: %i[index show]

  def index
    # search based on date range
    start_date = params.dig(:search, :start)
    end_date = params.dig(:search, :end)
    name_sport_or_location = params.dig(:search, :name_sport_or_location)

    @events = if params[:query].present?
                Event.near(params[:query][:location], 20)
              elsif name_sport_or_location.present?
                Event.search_by_name_location_and_sport(name_sport_or_location)
              elsif start_date.present? && end_date.present?
                Event.where(date: start_date..end_date)
              else
                Event.all
              end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
        marker_html: render_to_string(partial: "marker", locals: { event: event })
      }
    end
    if params[:filter].present?
      if(params[:filter] == "looking")
        @events = Event.all.select do |event|
          event.capacity > Play.where(event: event).count
        end
      elsif params[:filter] == "full"
        @events = Event.all.select do |event|
          event.capacity <= Play.where(event: event).count
        end
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @players = Play.where(event_id: @event.id).map do |player|
      player.user_id
    end
    @review = Review.new
    # @has_joined = players.include?(current_user.id)
    @play = Play.new
    @creator
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      # redirect_to event_plays_path(@event)
      play = Play.new
      play.event = @event
      play.user = current_user
      play.save
      chatroom = Chatroom.new
      chatroom.event = @event
      chatroom.save
      redirect_to events_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path(@event)
    else
      render :edit, :bad_request
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy!
      redirect_to events_path
    else
      redirect_to events_path, status: :see_other
    end
  end

  def calendar
    if(user_signed_in?)
      plays = Play.where(user: current_user)
      @events = Event.where(user: current_user)
      plays.each do |p|
        @events += Event.where(id: p.event_id)
      end
    end
  end

  def details
    @event = Event.find(params[:event_id])
    render partial: "shared/card", locals: { event: @event }, formats: [:html], status: :ok
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :capacity, :sport)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user_event
    @event = current_user.event_invites.find(params[:id])
  end
end
