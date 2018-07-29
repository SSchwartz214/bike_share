require 'rails_helper'

describe 'as a registered user' do
  describe "visiting show page" do
    it 'shows statistics for that station' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_4 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_2, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_1, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      visit station_path(station_1)

      expect(page).to have_content("Total rides: #{station_1.total_ride_starts}")
      expect(page).to have_content("Number of rides ended at this station: #{station_1.total_ride_ends}")
      expect(page).to have_content(station_1.most_frequent_destination)
      expect(page).to have_content(station_1.most_frequent_start)
      expect(page).to have_content(station_1.date_with_most_trips)
      expect(page).to have_content(station_1.zip_code_with_most_trips)
      expect(page).to have_content("Bike with most trips: #{station_1.bike_with_most_trips}")
    end
  end
end
