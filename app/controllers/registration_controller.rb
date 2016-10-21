class RegistrationController < ApplicationController

  def index
    @nursery = Nursery.find(params[:id])
  end

  def create
    @child = Child.new(
      first_name: params[:child_first_name],
      last_name: params[:child_last_name],
      birth_date: params[:birth_date],
      parents: current_parents
    )
    if @child.save
      session[:child_id] = @child.id
      nursery_id = params[:nursery_id]
      redirect_to "/registration/#{nursery_id}/confirmation"
    else
      @nursery = Nursery.find(params[:nursery_id])
      render 'index'
    end
  end

  def confirmation
    @nursery = Nursery.find(params[:id])
  end
end
