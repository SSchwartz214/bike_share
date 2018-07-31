class Condition < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :max_temperature_f
  validates_presence_of :mean_temperature_f
  validates_presence_of :min_temperature_f
  validates_presence_of :mean_humidity
  validates_presence_of :mean_visibility_miles
  validates_presence_of :mean_wind_speed_mph
  validates_presence_of :precipitation_inches

  def self.weather_during_trip(column, weather_params)
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

  def self.weather_average_during_trip(column, weather_params)
    rides = joins("JOIN trips ON conditions.date = trips.start_date")
      .where("#{column} BETWEEN ? AND ?", weather_params[0], weather_params[1])
      .group("conditions.id")
      .count

    rides.values.sum / rides.length.to_f
  end

  def self.trip_weather_average(column, weather_params)
    weather_params.inject({}) do |hash, (increments, value)|
      hash[increments] = Condition.weather_average_during_trip(column, value)
      hash
    end
  end


  def self.trip_weather_values(column, weather_params)
    weather_params.inject({}) do |hash, (increments, value)|
      hash[increments] = Condition.weather_during_trip(column, value)
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
    { "0.0 - .49in" => [0.0, 0.49],
      ".50 - .99in" => [0.50, 0.99],
      "1 - 1.49in" => [1, 1.49],
      "1.5 - 1.99in" => [1.5, 1.99]
      }
  end

  def self.wind_map
    { "0 - 3.9mph" => [0, 3.9],
      "4 - 7.9mph" => [4, 7.9],
      "8 - 11.9mph" => [8, 11.9],
      "12 - 15.9mph" => [12, 15.9],
      "16 - 19.9mph" => [16, 19.9],
      "20 - 23.9mph" => [20, 23.9] }
  end

  def self.vis_map
    {
      "4 - 7.9mi" => [4, 7.9],
      "8 - 11.9mi" => [8, 11.9],
      "12 - 15.9mi" => [12, 15.9],
      "16 - 19.9mi" => [16, 19.9],
      "20 - 23.9mi" => [20, 23.9] }
  end
end
