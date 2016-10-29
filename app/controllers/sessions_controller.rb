# Actions for login and logout by creating and deleting sessions.
class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_admin

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
