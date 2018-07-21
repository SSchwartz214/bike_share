class Condition < ApplicationRecord
  validates_presence_of :end_date
  validates_presence_of :max_temperature
  validates_presence_of :mean_temperature
  validates_presence_of :min_temperature
  validates_presence_of :mean_humididity
  validates_presence_of :mean_visibility
  validates_presence_of :mean_wind_speed
  validates_presence_of :precipitation
end
