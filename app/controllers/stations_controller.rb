class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  def index
    @stations = Station.all
  end

  def show

  end

  private

  def set_station
    @station = Station.friendly.find(params[:id])
  end
end
