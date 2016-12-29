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
    @parents = Parents.create(parents_params)

    if session[:redirect_to]
      redirect_to session[:redirect_to]
      session[:redirect_to] = nil
    else
      redirect_to root_path
    end

    session[:user_id] = @parents.user.id
  end

  private

  def parents_params
    params.require(:parents).permit(
      :first_name,
      :last_namme,
      user_attributes: [:email, :password]
    )
  end
end
