class TripsController < ApplicationController
  before_action :set_show, only: [:show]

  def index
    @trips = Trip.all
  end

  def show

  end

  private

  def set_show
    @show = Show.find(params[:id])
  end
end
