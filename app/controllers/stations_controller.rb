class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(slug: params[:slug])
  end

  private

  def set_station
  end
end
