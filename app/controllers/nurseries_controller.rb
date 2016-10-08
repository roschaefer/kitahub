# Actions to show and filter nurseries in the registration process.
class NurseriesController < ApplicationController
  def index
    @nurseries = Nursery.all
  end
end
