class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code

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

  def self.most_starting_rides

    Station.joins(:trips).where.maximum(:start_station)
  end
end
