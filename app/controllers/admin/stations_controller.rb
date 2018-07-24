class Admin::StationsController < ApplicationController
  before_action :require_admin
  before_action :set_station, only: [:edit, :update]

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:success] = "#{@station.name} created!"
      redirect_to station_path(@station)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @station.update(station_params)
    if @station.save
      flash[:success] = "#{@station.name} updated!"
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  private

  def set_station
    @station = Station.friendly.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name, :dock_count, :city, :installation_date)
  end
end
