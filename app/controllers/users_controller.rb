# frozen_string_literal: true
# Actions to create users, that can login to the application.
class UsersController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
