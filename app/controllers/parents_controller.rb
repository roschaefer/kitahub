# frozen_string_literal: true
# Actions to create parents. Parents are also users, thus this is the controller
# for parents sign up.
class ParentsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin

  def new
    @parents = Parents.new(user: User.new)
    session[:redirect_to] = request.referer
  end

  def create
    Parents.create(params.require(:parents).permit(:email, :password))
    redirect_to session[:redirect_to]
    session[:redirect_to] = nil
  end
end
