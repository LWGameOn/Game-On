class UsersController < ApplicationController
  before_action :set_user

  def show
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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :bio, :avatar)
  end
end
