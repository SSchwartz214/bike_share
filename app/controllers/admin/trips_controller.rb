class Admin::TripsController < Admin::BaseController

  def index
    @trips = Trip.all
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      flash[:notice] = "Trip updated successfully!"
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    flash[:notice] = "Trip deleted!"
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:duration, :start_date, :start_station, :end_date, :end_station, :bike_id, :subscription_type, :zip_code)
    end
end
