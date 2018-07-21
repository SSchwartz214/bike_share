require "rails_helper"

describe "a visitor" do
  describe "trips index" do
    xit "can see all trips and attributes" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: "8/29/2013 14:13", start_station_id: station_1.id, end_date: "8/29/2013 14:14", end_station_id: station_2.id, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: "8/28/2013 14:19", start_station_id: 4, end_date: "8/29/2013 14:17", end_station_id: 5, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      #TODO add pagination gem - verify 30 per page. Test pagination once gem is installed.

      visit trips_path

      expect(page).to have_content(trip_1.duration)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(station_1.name) #NOT start station ID, the actual station
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(station_2.name) #see above
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)

      expect(page).to have_content(trip_2.start_station)
      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.duration)
    end
  end

  describe "trip show path" do
    xit "can see trip information" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: "8/29/2013 14:13", start_station_id: station_1.id, end_date: "8/29/2013 14:14", end_station_id: station_2.id, subscription_type: "subscribed", zip_code: 12345)

      visit trip_path(trip_1)

      expect(page).to have_content(trip_1.duration)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(station_1.name) #NOT start station ID, the actual station
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(station_2.name) #see above
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)
    end
  end
end
