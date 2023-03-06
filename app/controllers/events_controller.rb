class EventsController < ApplicationController
  def index
    @events = Event.all
    # query = params[:query]
    # if query.present?
    #   @events = Event.all.where()
    # else
    #   @events = Event.all
    # end
end

  def create
    @event = Event.new(event_params)
  end

  private
  def event_params
    params.require(:event).permit(:name, )
  end

end
