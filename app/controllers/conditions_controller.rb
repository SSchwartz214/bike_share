class ConditionsController < ApplicationController
  def index
    @conditions = Condition.paginate(:page => params[:page], :per_page => 50)
  end

  def dashboard

    @max_temp_trips_by_range = Condition.trip_weather_values("max_temperature_f", Condition.heat_map)
    @prec_trips_by_range = Condition.trip_weather_values("precipitation_inches", Condition.prec_map)
    @wind_trips_by_range = Condition.trip_weather_values("mean_wind_speed_mph", Condition.wind_map)
    @vis_trips_by_range = Condition.trip_weather_values("mean_visibility_miles", Condition.vis_map)
  end

  def show
    @condition = Condition.find(params[:id])
  end
end
