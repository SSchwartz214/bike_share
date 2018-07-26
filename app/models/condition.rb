class Condition < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :max_temperature_f
  validates_presence_of :mean_temperature_f
  validates_presence_of :min_temperature_f
  validates_presence_of :mean_humidity
  validates_presence_of :mean_visibility_miles
  validates_presence_of :mean_wind_speed_mph
  validates_presence_of :precipitation_inches

  def self.highest_rides(weather_params)
    rides = joins("JOIN trips ON conditions.date = trips.start_date")
      .select("conditions.date, count(trips.id) as trip_total")
      .where(max_temperature_f: weather_params)
      .group("conditions.date")
      .order("trip_total")
    if rides.first.nil?
      0
    else
      rides.first.trip_total
    end
  end

  def self.trip_weather_values(weather_params)
    weather_params.inject({}) do |hash, (key, value)|
      hash[key] = Condition.highest_rides(value)
      hash
    end
  end

  def self.heat_map
    {"80..89f" => 80..89,
      "90..99f" => 90..99}
  end
end

##
# #   As a registered user,
#   # When I visit '/conditions-dashboard',
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments,
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments,
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
#
#
#
#   # Condition.joins("JOIN trips ON conditions.date = trips.start_date").where(max_temperature_f: [variable temps]).count
#
#   # Condition.joins("JOIN trips ON conditions.date = trips.start_date").where(max_temperature_f: 50..59).group("conditions.date").count("trips.id")
#
#   # hash = { "max_temperature_f" => 40..49, "max_temperature_f" => 50..59}
#
#   # Condition.joins("JOIN trips ON conditions.date = trips.start_date").select("conditions.date, count(trips.id) as trip_total").where(max_temperature_f: 70..79).group("conditions.date").order(:trip_total).first --- returns day with highest trips
