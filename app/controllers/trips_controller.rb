class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
