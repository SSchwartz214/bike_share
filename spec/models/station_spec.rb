require 'rails_helper'

describe Station, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end

  describe 'class methods' do
    it 'can return the average number of bikes' do
      station_1 = Station.create!(name: "aiojd", dock_count: 10, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.average_bikes).to eq(15)
    end


    it 'can return the most bikes' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.most_bikes).to eq(20)
    end

    it 'can return the station with the most bikes' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.most_bikes_station).to eq(station_2)
    end

    it 'can return the fewest bikes' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.fewest_bikes).to eq(8)
    end

    it 'can return the station with the fewest bikes' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.fewest_bikes_station).to eq(station_1)
    end

    it 'can return the newest station' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.newest).to eq(station_2)

    end
    it 'can return the oldest station' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      expect(Station.oldest).to eq(station_1)

    end
  end

  describe 'instance methods' do
    it 'can return the number of rides started there' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)

      expect(station_1.total_ride_starts).to eq(3)
    end
    it 'can return the number of rides ended there' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      expect(station_2.total_ride_ends).to eq(2)
    end

    it 'can return the most frequent destination station' do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "ajse3d0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_3, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      expect(station_1.most_frequent_destination).to eq(station_2)
    end
  end
end
