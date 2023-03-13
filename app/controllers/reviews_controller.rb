class ReviewsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @play = Play.where(event_id: @event.id)
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = current_user
    if @review.save
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
      raise
    end
  end

  def edit
    @review = Review.find(params[:id])
    @event = Event.find(@review.event_id)
  end

  def update
    if @review.update(review_params)
      redirect_to events_path(@event)
    else
      render :edit, :bad_request
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to event_path(@review.event), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :event_id)
  end
end
