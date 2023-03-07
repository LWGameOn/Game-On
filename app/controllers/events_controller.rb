class EventsController < ApplicationController
  before_action :set_event, only: :show
  before_action :set_user_event, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
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
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    else
      redirect_to events_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :time, :capacity, :short)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user_event
    @event = current_user.event_invites.find(params[:id])
  end
end
