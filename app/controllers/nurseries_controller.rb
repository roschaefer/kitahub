class NurseriesController < ApplicationController
  def index
    @nurseries = Nursery.where(district: params[:district])
    @districts = Nursery.uniq.pluck(:district)
  end

  def results
    @nurseries = Nursery.where(district: params[:district])
    render :partial => "results"
  end
end
