class Admin::TripsController < Admin::BaseController

  def edit
    @trip = Trip.find(params[:id])
  end

end
