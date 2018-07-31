require 'rails_helper'

describe Condition, type: :model do
  before :each do
    @station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

    # ------------

    @condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 95, mean_temperature_f: 60, min_temperature_f: 123, mean_humidity: 3, mean_visibility_miles: 3, mean_wind_speed_mph: 3, precipitation_inches: 0.12)

    @trip_4 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: @station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

    @trip_5 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: @station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

    @trip_6 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: @station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

    @trip_2 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("7/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: @station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

    # ------------

    @condition_2 = Condition.create!(date: Date.strptime("8/1/2013", '%m/%d/%Y'), max_temperature_f: 83, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 3, mean_wind_speed_mph: 2, precipitation_inches: 0.25)

    @trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("8/1/2013 14:19", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("8/30/2013 15:19", '%m/%d/%Y %H:%M'), end_station: @station_1, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

    # ------------

    @condition_3 = Condition.create!(date: Date.strptime("7/29/2013", '%m/%d/%Y'), max_temperature_f: 94, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 7, mean_wind_speed_mph: 6, precipitation_inches: 0.6)

    @trip_1 = Trip.create!(duration: 100, start_date: DateTime.strptime("7/29/2013", '%m/%d/%Y'), start_station: @station_1, end_date: DateTime.strptime("8/29/2013", '%m/%d/%Y'), end_station: @station_1, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
  end

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
    it ".trip_weather_values returns temp values" do
      max_temp = "max_temperature_f"

      weather_params = {"80..89f" => [80, 89], "90..99f" => [90, 99]}

      expected = {"80..89f" => [1, 1], "90..99f" => [4, 1]}

      expect(Condition.trip_weather_values(max_temp, weather_params)).to eq(expected)
    end

    it ".trip_weather_values returns prec values" do
      prec = "precipitation_inches"

      weather_params = { "0.0 - .49in" => [0.0, 0.49], ".50 - .99in" => [0.50, 0.99] }

      expected = { "0.0 - .49in" => [4, 1], ".50 - .99in" => [1, 1] }

      expect(Condition.trip_weather_values(prec, weather_params)).to eq(expected)
    end

    it ".trip_weather_values returns wind speed values" do
      wind = "mean_wind_speed_mph"

      weather_params = { "0 - 3.9mph" => [0, 3.9], "4 - 7.9mph" => [4, 7.9] }

      expected = { "0 - 3.9mph" => [4, 1], "4 - 7.9mph" => [1, 1] }

      expect(Condition.trip_weather_values(wind, weather_params)).to eq(expected)
    end

    it ".trip_weather_values returns visibility values" do
      vis = "mean_visibility_miles"

      weather_params =   { "0 - 3.9mi" => [0, 3.9], "4 - 7.9mi" => [4, 7.9]}

      expected = { "0 - 3.9mi" => [4, 1], "4 - 7.9mi" => [1, 1] }

      expect(Condition.trip_weather_values(vis, weather_params)).to eq(expected)
    end

    it ".trip_weather_average returns average temp values" do
      max_temp = "max_temperature_f"

      weather_params = {"80..89f" => [80, 89], "90..99f" => [90, 99]}

      expected = {"80..89f" => 1, "90..99f" => 2.5}

      expect(Condition.trip_weather_average(max_temp, weather_params)).to eq(expected)
    end

    it ".trip_weather_average returns average prec values" do
      prec = "precipitation_inches"

      weather_params = { "0.0 - .49in" => [0.0, 0.49], ".50 - .99in" => [0.50, 0.99] }

      expected = { "0.0 - .49in" => 2.5, ".50 - .99in" => 1 }

      expect(Condition.trip_weather_average(prec, weather_params)).to eq(expected)
    end

    it ".trip_weather_average returns average wind values" do
      wind = "mean_wind_speed_mph"

      weather_params = { "0 - 3.9mph" => [0, 3.9], "4 - 7.9mph" => [4, 7.9] }

      expected = { "0 - 3.9mph" => 2.5, "4 - 7.9mph" => 1 }

      expect(Condition.trip_weather_average(wind, weather_params)).to eq(expected)
    end

    it ".trip_weather_average returns average vis values" do
      vis = "mean_visibility_miles"

      weather_params =   { "0 - 3.9mi" => [0, 3.9], "4 - 7.9mi" => [4, 7.9]}

      expected = { "0 - 3.9mi" => 2.5, "4 - 7.9mi" => 1 }

      expect(Condition.trip_weather_average(vis, weather_params)).to eq(expected)
    end
  end
end
