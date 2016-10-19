class RegistrationController < ApplicationController

  def index
    @nursery = Nursery.find(params[:id])
  end

end
