class NurseriesController < ApplicationController
  def index
    @nurseries = Nursery.all
  end
end
