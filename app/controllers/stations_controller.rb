class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  def index
    @stations = Station.all
  end

  def show
    unless @station.start_trips.empty?
      @total_ride_starts = @station.total_ride_starts
      @total_ride_ends = @station.total_ride_ends
      @most_frequent_destination = @station.most_frequent_destination
      @most_frequent_start = @station.most_frequent_start
      @date_with_most_trips = @station.date_with_most_trips
      @zip_code_with_most_trips = @station.zip_code_with_most_trips
      @bike_with_most_trips = @station.bike_with_most_trips
    end
  end

  def dashboard
    @total = Station.count
    @average_bikes = Station.average_bikes
    @most_bikes = Station.most_bikes
    @most_bikes_station = Station.most_bikes_station.name
    @fewest_bikes = Station.fewest_bikes
    @fewest_bikes_station = Station.fewest_bikes_station.name
    @newest = Station.newest.name
    @oldest = Station.oldest.name
  end

  def destroy
    set_station.destroy
    flash[:success] = "Station deleted"
    redirect_to stations_path
  end

  private

  def set_station
    @station = Station.friendly.find(params[:id])
  end
end
