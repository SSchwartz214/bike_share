class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"

  def self.avg_duration
    average(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.month_by_month
    #TODO helper method to convert date
    group("DATE_TRUNC('month', start_date)").count
    .inject({}) do |hash, (k, v)|
      hash[k.to_date.to_s] = v
      hash
    end
  end

  def self.by_year
    #TODO helper method to convert date
    group("DATE_TRUNC('year', start_date)").count
    .inject({}) do |hash, (k, v)|
      hash[k.to_date.to_s] = v
      hash
    end
  end

  def self.trips_by_bike
    bike = select('trips.bike_id, count(trips.bike_id) AS trip_count')
    .group(:bike_id)
    .order('trip_count DESC')

    bike_hash = {}
    bike_hash[bike.first.bike_id] = bike.first.trip_count
    bike_hash[bike.last.bike_id] = bike.last.trip_count
    bike_hash
  end

  def self.subscription_by_user
    group(:subscription_type)
    .count
  end

  def self.trips_by_date
    date = select('trips.start_date, count(trips.id) AS trip_count')
    .group(:start_date)
    .order('trip_count DESC')

    date_hash = {}
    date_hash[date.first.start_date] = date.first.trip_count
    date_hash[date.last.start_date] = date.last.trip_count
    date_hash
  end

  def self.trip_weather
    weather = Condition.joins('JOIN trips ON conditions.date = trips.start_date')
    .select('conditions.*, count(trips.id) AS trip_total')
    .group('conditions.id')
    .order('trip_total')

    weather_hash = {}
    weather_hash[weather.first.date] = weather.first
    weather_hash[weather.last.date] = weather.last
    weather_hash
  end
end
