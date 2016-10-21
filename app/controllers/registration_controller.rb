class RegistrationController < ApplicationController

  def index
    @nursery = Nursery.find(params[:id])
  end

  def create
    @child = Child.create(
      first_name: params[:first_name],
      last_name: params[:first_name],
      birth_date: params[:birth_date],
    )
    nursery_id = params[:nursery_id]
    redirect_to "/registration/#{nursery_id}/confirmation"
  end
end
