class Admin::TripsController < Admin::BaseController

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    flash.notice = "Trip Deleted"
    redirect_to trips_path
  end

  private
    def require_admin
      render file: '/public/404' unless current_admin?
    end

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :start_station, :end_date, :end_station, :bike_id, :subscription_type, :zip_code)
    end
end
