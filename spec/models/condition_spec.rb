require 'rails_helper'

describe Condition, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:max_temperature_f)}
    it {should validate_presence_of(:mean_temperature_f)}
    it {should validate_presence_of(:min_temperature_f)}
    it {should validate_presence_of(:mean_humidity)}
    it {should validate_presence_of(:mean_visibility_miles)}
    it {should validate_presence_of(:mean_wind_speed_mph)}
    it {should validate_presence_of(:precipitation_inches)}
  end

  describe "class methods" do
    it ".trip_weather_values returns lowest and highest number of rides per temperature range" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 95, mean_temperature_f: 60, min_temperature_f: 123, mean_humidity: 3, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      condition_2 = Condition.create!(date: Date.strptime("8/1/2013", '%m/%d/%Y'), max_temperature_f: 83, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 105, mean_wind_speed_mph: 275, precipitation_inches: 115)

      condition_3 = Condition.create!(date: Date.strptime("7/29/2013", '%m/%d/%Y'), max_temperature_f: 94, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 105, mean_wind_speed_mph: 275, precipitation_inches: 115)

      condition_4 = Condition.create!(date: Date.strptime("8/28/2013", '%m/%d/%Y'), max_temperature_f: 95, mean_temperature_f: 60, min_temperature_f: 123, mean_humidity: 3, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)
      trip_1 = Trip.create!(duration: 100, start_date: DateTime.strptime("7/29/2013", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), end_station: station_1, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

      trip_2 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("7/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("8/1/2013 14:19", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("8/30/2013 15:19", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      trip_4 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      trip_5 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      trip_6 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)


      weather_params = {"80..89f" => 80..89, "90..99f" => 90..99}

      expected = {"80..89f" => [1, 1], "90..99f" => [4, 1]}

      expect(Condition.trip_temp_values(weather_params)).to eq(expected)
    end
  end
end
