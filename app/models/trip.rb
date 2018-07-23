class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"

  def seconds_to_time(seconds)
    [seconds / 3600, seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
  end

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
    group("DATE_TRUNC('month', start_date)").count
    .inject({}) do |hash, (k, v)|
      hash[k.to_date.to_s] = v
      hash
    end
  end
end
