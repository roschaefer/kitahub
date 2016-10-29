require 'date'

# Actions to show and filter nurseries in the registration process.
class NurseriesController < ApplicationController
  def index
    @nurseries = Nursery.where(district: params[:district])
    @districts = Nursery.uniq.pluck(:district)
  end

  def show
    @nursery = Nursery.where(url_name: params[:url_name]).first
  end

  def new
    @nursery = Nursery.new
    @nursery.address = Address.new('', '', '')
  end

  def create
    address = params[:address]
    @nursery = Nursery.new(nursery_params)
    @nursery.address = Address.new(
      address[:street],
      address[:zip],
      address[:city]
    )
    if @nursery.save
      redirect_to @nursery
    else
      render 'new'
    end
  end

  def edit
    @nursery = Nursery.where(url_name: params[:url_name]).first
  end

  def update
    address = params[:address]
    @nursery = Nursery.where(url_name: params[:url_name]).first
    @nursery.address = Address.new(
      address[:street],
      address[:zip],
      address[:city]
    )
    if @nursery.update(nursery_params)
      redirect_to @nursery
    else
      render 'edit'
    end
  end

  def destroy
    @nursery = Nursery.where(url_name: params[:url_name]).first
    @nursery.destroy
    render 'delete_confirmation' if @nursery.destroy
  end

  def results
    @nurseries = Nursery.where(district: params[:district])
    render partial: 'results'
  end

  def first_request
    @nursery = Nursery.where(url_name: params[:nurseries_url_name]).first
  end

  def send_first_request
    @child = Child.new(
      first_name: params[:child_first_name],
      last_name: params[:child_last_name],
      birth_date: Date.parse(params[:child_birth_date]),
      gender: params[:child_gender],
      parents: current_parents
    )
    save_child
  end

  private

  def nursery_params
    params.require(:nursery).permit(
      :name,
      :district,
      :mail,
      :phone,
      :children_age,
      :care_time,
      :education_concept,
      :management,
      :capacity
    )
  end

  def save_child
    @nursery = Nursery.where(url_name: params[:nurseries_url_name]).first
    render 'first_request_confirmation' if @child.save
  end
end
