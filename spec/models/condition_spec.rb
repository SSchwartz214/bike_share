require 'rails_helper'

describe Condition, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:end_date)}
    it {should validate_presence_of(:max_temperature)}
    it {should validate_presence_of(:mean_temperature)}
    it {should validate_presence_of(:min_temperature)}
    it {should validate_presence_of(:mean_humididity)}
    it {should validate_presence_of(:mean_visibility)}
    it {should validate_presence_of(:mean_wind_speed)}
    it {should validate_presence_of(:precipitation)}
  end
end
