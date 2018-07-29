require "rails_helper"

describe "a visitor" do
  describe "visits trips dashboard" do
    it "sees statistics for rides" do
      station = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      condition_1 = Condition.create!(date: Date.strptime("1/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)
      condition_2 = Condition.create!(date: Date.strptime("2/20/2014", '%m/%d/%Y'), max_temperature_f: 12345, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 105, mean_wind_speed_mph: 275, precipitation_inches: 115)

      trip_1 = Trip.create!(duration: 60, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Subscriber", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 180, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12444, bike_id: 1)
      trip_3 = Trip.create!(duration: 120, start_date: Date.strptime("2/20/2014", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12446, bike_id: 2)
      visit trips_dashboard_path

      expect(page).to have_content("1 minute")
      expect(page).to have_content("2 minutes")
      expect(page).to have_content("3 minutes")

      within "#worst-day" do
        expect(page).to have_content(condition_2.max_temperature_f)
        expect(page).to have_content(condition_2.min_temperature_f)
        expect(page).to have_content(condition_2.mean_temperature_f)
        expect(page).to have_content(condition_2.mean_humidity)
        expect(page).to have_content(condition_2.mean_visibility_miles)
        expect(page).to have_content(condition_2.mean_wind_speed_mph)
        expect(page).to have_content(condition_2.precipitation_inches)
      end
    end
  end
end
