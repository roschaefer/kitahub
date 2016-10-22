# Actions to save a child data for the first request in a nursery.
class RegistrationController < ApplicationController
  def index
    @nursery = Nursery.find(params[:id])
  end

  def create
    @child = Child.new(
      first_name: params[:child_first_name],
      last_name: params[:child_last_name],
      birth_date: params[:birth_date],
      gender: params[:child_gender],
      parents: current_parents
    )
    save_child
  end

  def confirmation
    @nursery = Nursery.find(params[:id])
  end

  private

  def save_child
    if @child.save
      session[:child_id] = @child.id
      nursery_id = params[:nursery_id]
      redirect_to registration_confirmation_path(nursery_id)
    else
      @nursery = Nursery.find(params[:nursery_id])
      render 'index'
    end
  end
end
