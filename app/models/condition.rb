class Condition < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :max_temperature_f
  validates_presence_of :mean_temperature_f
  validates_presence_of :min_temperature_f
  validates_presence_of :mean_humidity
  validates_presence_of :mean_visibility_miles
  validates_presence_of :mean_wind_speed_mph
  validates_presence_of :precipitation_inches

  def self.temp_during_trip(column, weather_params)
    rides = joins("JOIN trips ON conditions.date = trips.start_date")
      .select("conditions.date, count(trips.id) as trip_total")
      .where("#{column} BETWEEN ? AND ?", weather_params[0], weather_params[1])
      .group("conditions.date")
      .order("trip_total asc")
    if rides.last.nil?
      0
    else
      [rides.last.trip_total, rides.first.trip_total]
    end
  end

  def self.trip_temp_values(column, weather_params)
    weather_params.inject({}) do |hash, (key, value)|
      hash[key] = Condition.temp_during_trip(column, value)
      hash
    end
  end

  def self.heat_map
    { "40 - 49f" => [40, 49],
      "50 - 59f" => [50, 59],
      "60 - 69f" => [60, 69],
      "70 - 79f" => [70, 79],
      "80 - 89f" => [80, 89],
      "90 - 99f" => [90, 99] }
  end

  def self.prec_map
    { "0.0 - .49in" => 0.0..0.49,
      ".50 - .99in" => 0.50..0.99,
      "1 - 1.49in" => 1..1.49,
      "1.5 - 1.99in" => 1.5..1.99,
      "2 - 2.49in" => 2..2.49,
      "2.5 - 2.99in" => 2.5..2.99,
      "3 - 3.49in" => 3..3.49,
      "3.5 - 4in" => 3.5..4 }
  end

  def self.wind_map
    { "0 - 3.9mph" => 0..3.9,
      "4 - 7.9mph" => 4..7.9,
      "8 - 11.9mph" => 8..11.9,
      "12 - 15.9mph" => 12..15.9,
      "16 - 19.9mph" => 16..19.9,
      "20 - 23.9mph" => 20..23.9 }
  end
end

##
# #   As a registered user,
#   # When I visit '/conditions-dashboard',
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments,
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments,
#   # I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
