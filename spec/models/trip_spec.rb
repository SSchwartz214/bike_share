require 'rails_helper'

describe Trip, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:start_station_id)}
    it {should validate_presence_of(:end_date)}
    it {should validate_presence_of(:end_station_id)}
    it {should validate_presence_of(:bike_id)}
    it {should validate_presence_of(:subscription_type)}
    it {should validate_presence_of(:zip_code)}
  end
# As a registered user,
# When I visit '/trips-dashboard',
# I see the Shortest ride,
# I see the Station with the most rides as a starting place,
# I see the Station with the most rides as an ending place,
# I see Month by Month breakdown of number of rides with subtotals for each year,
# I see the Most ridden bike with total number of rides for that bike,
# I see the Least ridden bike with total number of rides for that bike,
# I see the User subscription type breakout with both count and percentage,
# I see the Single date with the highest number of trips with a count of those trips,
# I see the Single date with the lowest number of trips with a count of those trips.
  describe 'Class methods' do
    it ".avg_duration" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 100, start_date: "8/29/2013 14:13", start_station: station_1, end_date: "8/29/2013 14:14", end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 200, start_date: "8/28/2013 14:19", start_station: station_3, end_date: "8/29/2013 14:17", end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: "8/28/2013 14:19", start_station: station_5, end_date: "8/29/2013 14:17", end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.avg_duration).to eq(200)
    end
    it ".longest_ride" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 100, start_date: "8/29/2013 14:13", start_station: station_1, end_date: "8/29/2013 14:14", end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 200, start_date: "8/28/2013 14:19", start_station: station_3, end_date: "8/29/2013 14:17", end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: "8/28/2013 14:19", start_station: station_5, end_date: "8/29/2013 14:17", end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.longest_ride).to eq(trip_3.duration)
    end
    it ".shortest_ride" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 100, start_date: "8/29/2013 14:13", start_station: station_1, end_date: "8/29/2013 14:14", end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 200, start_date: "8/28/2013 14:19", start_station: station_3, end_date: "8/29/2013 14:17", end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: "8/28/2013 14:19", start_station: station_5, end_date: "8/29/2013 14:17", end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.shortest_ride).to eq(trip_1.duration)
    end
  end

end
