require 'date'

# Actions to show and filter nurseries in the registration process.
class NurseriesController < ApplicationController
  skip_before_action :require_login,
                     only: [:index, :results, :show]
  skip_before_action :require_admin,
                     only: [
                       :index,
                       :results,
                       :show,
                       :first_request,
                       :send_first_request
                     ]

  def index
    @nurseries = Nursery.where(district: params[:district])
    @districts = Nursery.uniq.pluck(:district)
  end

  def show
    @nursery = Nursery.find_by url_name: params[:url_name]
  end

  def new
    @nursery = Nursery.new
    @nursery.address = Address.new('', '', '')
  end

  def create
    @nursery = Nursery.new(nursery_params)
    if @nursery.save
      redirect_to @nursery
    else
      render 'new'
    end
  end

  def edit
    @nursery = Nursery.find_by url_name: params[:url_name]
  end

  def update
    @nursery = Nursery.find_by url_name: params[:url_name]
    if @nursery.update(nursery_params)
      redirect_to @nursery
    else
      render 'edit'
    end
  end

  def destroy
    @nursery = Nursery.find_by url_name: params[:url_name]
    @nursery.destroy
    render 'delete_confirmation' if @nursery.destroy
  end

  def results
    @nurseries = Nursery.where(district: params[:district])
    render partial: 'results'
  end

  def first_request
    @nursery = Nursery.find_by url_name: params[:nursery_url_name]
    @registration = Registration.new
    @registration.children = [Child.new]
  end

  def send_first_request
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

  def nursery_params
    address = params.require(:address)
    params.require(:nursery).permit!.merge(
      address_street: address[:street],
      address_zip: address[:zip],
      address_city: address[:city]
    )
  end

  def registration_params
    params.require(:registration).permit(
      :preferred_start_date,
      children_attributes: [:first_name, :last_name, :gender, :birth_date]
    )
  end
end
