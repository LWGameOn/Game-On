class EventsController < ApplicationController
  before_action :set_event, only: :show
  before_action :set_user_event, only: :destroy
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
    # query = params[:query]
    # if query.present?
    #   @events = Event.all.where()
    # else
    #   @events = Event.all
    # end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path
    else
      render :new, :bad_request
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
