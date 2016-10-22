# Actions to show and filter nurseries in the registration process.
class NurseriesController < ApplicationController
  def index
    @nurseries = Nursery.where(district: params[:district])
    @districts = Nursery.uniq.pluck(:district)
  end

  def results
    @nurseries = Nursery.where(district: params[:district])
    render partial: 'results'
  end

  def first_request
    @nursery = Nursery.find(params[:nurseries_id])
  end

  def send_first_request
    @child = Child.new(
      first_name: params[:child_first_name],
      last_name: params[:child_last_name],
      birth_date: params[:birth_date],
      gender: params[:child_gender],
      parents: current_parents
    )
    save_child
  end

  private

  def save_child
    if @child.save
      @nursery = Nursery.find(params[:nurseries_id])
      render 'first_request_confirmation'
    else
      @nursery = Nursery.find(params[:nursery_id])
    end
  end
end
