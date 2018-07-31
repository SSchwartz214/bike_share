require "rails_helper"

describe "an admin" do
  describe "visits condition dashboard" do
    before :each do
      @admin = User.create!(id:1004, first_name: "admin", last_name: "admin", username: "admin", password:"admin", address: "15 admin way", role: 1, city: "Denver", state: "CO", zip_code: 12345)
      @station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013", slug: "aiojd")

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

    it "can see stats" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit "/conditions-dashboard"
      
      expect(page).to have_content("Trips by temperature range")
      expect(page).to have_content("Trips by wind speed range")
      expect(page).to have_content("Trips by precipitation range")
      expect(page).to have_content("Trips by visibility range")
    end
  end
end
