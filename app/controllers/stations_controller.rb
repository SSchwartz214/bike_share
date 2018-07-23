class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  def index
    @stations = Station.all
  end

  def show

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

  private

  def set_station
    @station = Station.friendly.find(params[:id])
  end
end
