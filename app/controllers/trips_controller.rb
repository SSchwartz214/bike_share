class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
  end

  def dashboard
    @average_ride = Trip.avg_duration.to_i
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @trips_by_month = Trip.month_by_month
    @trips_by_year = Trip.by_year
    @trips_by_bike = Trip.trips_by_bike
    @subscription_status = Trip.subscription_by_user
    @trips_by_date = Trip.trips_by_date
    @trips_weather = Trip.trip_weather.values
  end

  def show
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
