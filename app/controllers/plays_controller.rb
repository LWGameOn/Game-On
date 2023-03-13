class PlaysController < ApplicationController
  def create
    @play = Play.new
    @play.user = current_user
    @play.event = Event.find(params[:event_id])
    if @play.save!
      raise
      redirect_to event_path(@play.event)
    else
      render :new, status: :bad_request
    end
  end

  def destroy
    if current_user == @play.user
      @play.destroy
      redirect_to plays_path, status: :see_other
    else
      # Job doesn't belong to current user
      redirect_to plays_path, status: :bad_request
    end
  end

  private

  def plays_params
    params.require(:play).permit(:user_id, :id)
  end
end
