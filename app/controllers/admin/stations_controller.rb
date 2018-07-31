class Admin::StationsController < Admin::BaseController
  before_action :set_station, only: [:edit, :update, :destroy]

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
    @station.slug = @station.name
    if @station.save
      flash[:success] = "#{@station.name} updated!"
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  def destroy
    name = set_station.name
    set_station.destroy
    flash[:success] = "#{name} Station deleted"
    redirect_to stations_path
  end

  private

  def set_station
    @station = Station.friendly.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name, :dock_count, :city, :installation_date, :slug)
  end
end
