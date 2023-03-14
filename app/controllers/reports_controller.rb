class ReportsController < ApplicationController
  def new
    @report = Report.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @play = Play.where(user_id: @user.id)
    @report = Report.new(report_params)
    @report.user = @user
    if @report.save
      redirect_to user_path(@user)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:complaint, :user_id)
  end
end
