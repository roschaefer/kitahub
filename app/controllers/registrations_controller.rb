# frozen_string_literal: true
# Actions to create a registration. This controller is used as a nested
# controller under nurseries.
class RegistrationsController < ApplicationController
  skip_before_action :require_admin,
                     only: [:new, :create]

  def new
    @nursery = Nursery.find_by url_name: params[:nursery_url_name]
    @registration = Registration.new
    @registration.children = [Child.new]
  end

  def create
    @nursery = Nursery.find_by url_name: params[:nursery_url_name]

    @registration = Registration.new(registration_params)
    @registration.nursery = @nursery
    @registration.children.each do |child|
      child.parents = current_parents
    end
    @registration.save

    render :first_request_confirmation
  end

  private

  def registration_params
    params.require(:registration).permit(
      :preferred_start_date,
      children_attributes: [:first_name, :last_name, :gender, :birth_date]
    )
  end
end
