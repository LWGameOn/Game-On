class EventsController < ApplicationController
  before_action :set_event, only: :show
  before_action :set_user_event, only: :destroy
  before_action :authenticate_user!, except: %i[index show]

  def index
    if params[:query].present?
      @events = Event.near(params[:query][:location], 20)
    else
      @events = Event.all
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
        marker_html: render_to_string(partial: "marker", locals: { event: event })
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    players = Play.where(event_id: @event.id).map do |player|
      player.user_id
    end
    @has_joined = players.include?(current_user.id)
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
    if @event.destroy!
      redirect_to events_path
    else
      redirect_to events_path, status: :see_other
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :time, :capacity, :sport)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user_event
    @event = current_user.event_invites.find(params[:id])
  end
end
