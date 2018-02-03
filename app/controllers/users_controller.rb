# The profile side of the User model

class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      flash[:danger] = "You must be logged in to do that."
      redirect_to root_path
  end

  def update
  end
end