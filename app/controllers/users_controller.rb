class UsersController < ApplicationController
  before_action :set_user

  def show
    @report = Report.new
    if params[:filter] == 'past'
      @events = Event.where(user: @user).select { |e| e.date.before?(DateTime.now) }
      @plays = Play.where(user: @user).select { |p| p.event.date.before?(DateTime.now) }
    else
      @events = Event.where(user: @user).select { |e| e.date.after?(DateTime.now) }
      @plays = Play.where(user: @user).select { |p| p.event.date.after?(DateTime.now) }
    end
  end

  def edit
  end

  def update
    if(current_user == @user)
      @user.update(user_params)
    else
      puts "NOT YOUR PROFILE TO EDIT"
    end
    redirect_to user_path(@user)
  end

  def report

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :bio, :avatar)
  end
end
