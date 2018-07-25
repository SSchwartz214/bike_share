require "rails_helper"

describe "a visitor" do
  describe "trips index" do
    it "can see all trips and attributes" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      visit trips_path

      expect(page).to have_content(trip_1.duration/60)
      expect(page).to have_content(trip_1.start_date.to_s.chomp(":00 UTC"))
      expect(page).to have_content(station_1.name)
      expect(page).to have_content(trip_1.end_date.to_s.chomp(":00 UTC"))
      expect(page).to have_content(station_2.name)
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)

      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.duration/60)
    end
  end

  describe "trip show path" do
    it "can see trip information" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

      visit trip_path(trip_1)

      expect(page).to have_content(trip_1.duration/60)
      expect(page).to have_content(trip_1.start_date.to_s.chomp(":00 UTC"))
      expect(page).to have_content(station_1.name) #NOT start station ID, the actual station
      expect(page).to have_content(trip_1.end_date.to_s.chomp(":00 UTC"))
      expect(page).to have_content(station_2.name) #see above
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)
    end
  end
end
