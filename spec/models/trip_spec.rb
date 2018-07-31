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
  end

  describe 'Class methods' do
    it ".avg_duration" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 100, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 200, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_3, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("8/30/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_5, end_date: DateTime.strptime("8/30/2013 15:19", '%m/%d/%Y %H:%M'), end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.avg_duration).to eq(200)
    end

    it ".longest_ride" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_3, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("8/30/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_5, end_date: DateTime.strptime("8/30/2013 15:19", '%m/%d/%Y %H:%M'), end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.longest_ride).to eq(trip_3.duration)
    end

    it ".shortest_ride" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("8/28/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_3, end_date: DateTime.strptime("8/29/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("8/30/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_5, end_date: DateTime.strptime("8/30/2013 15:19", '%m/%d/%Y %H:%M'), end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expect(Trip.shortest_ride).to eq(trip_1.duration)
    end

    it ".month_by_month" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("1/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("2/27/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_3, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("2/20/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_5, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expected = Trip.month_by_month

      expect(expected["2013-01-01"]).to eq(1)
      expect(expected["2013-02-01"]).to eq(2)
    end

    it ".by_year" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_3 = Station.create!(name: "sdfsd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_4 = Station.create!(name: "fdsfaf", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_5 = Station.create!(name: "hgff", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      station_6 = Station.create!(name: "fvfdfr", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("1/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("2/27/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station_3, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station_4, subscription_type: "visitor", zip_code: 12444, bike_id: 2)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("2/20/2014 14:19", '%m/%d/%Y %H:%M'), start_station: station_5, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station_6, subscription_type: "visitor", zip_code: 12446, bike_id: 3)

      expected = Trip.by_year

    expect(expected["2013-01-01"]).to eq(2)
    end

    it '.trips_by_bike' do
      station = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("1/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("2/27/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "visitor", zip_code: 12444, bike_id: 1)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("2/20/2014 14:19", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "visitor", zip_code: 12446, bike_id: 2)

      expected = {1 => 2,
                  2 => 1
                }

      expect(Trip.trips_by_bike).to eq(expected)
    end

    it '.subscription_by_user' do
      station = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

      trip_1 = Trip.create!(duration: 123, start_date: DateTime.strptime("1/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Subscriber", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: DateTime.strptime("2/27/2013 14:19", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12444, bike_id: 1)
      trip_3 = Trip.create!(duration: 300, start_date: DateTime.strptime("2/20/2014 14:19", '%m/%d/%Y %H:%M'), start_station: station, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12446, bike_id: 2)

      expected = {"Subscriber" => 1,
                  "Customer" => 2
                  }

    expect(Trip.subscription_by_user).to eq(expected)
    end

    it '.trips_by_date' do
      station = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

      trip_1 = Trip.create!(duration: 123, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Subscriber", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12444, bike_id: 1)
      trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("2/20/2014", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12446, bike_id: 2)

      expected = {trip_1.start_date => 2,
                  trip_3.start_date => 1
                  }

      expect(Trip.trips_by_date).to eq(expected)
    end

    it '.trip_weather' do
      station = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      condition_1 = Condition.create!(date: Date.strptime("1/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)
      condition_2 = Condition.create!(date: Date.strptime("2/20/2014", '%m/%d/%Y'), max_temperature_f: 12345, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 105, mean_wind_speed_mph: 275, precipitation_inches: 115)
      trip_1 = Trip.create!(duration: 123, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("1/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Subscriber", zip_code: 12345, bike_id: 1)
      trip_2 = Trip.create!(duration: 198, start_date: Date.strptime("1/29/2013", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("2/27/2013 14:17", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12444, bike_id: 1)
      trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("2/20/2014", "%m/%d/%Y"), start_station: station, end_date: DateTime.strptime("3/30/2014 15:19", '%m/%d/%Y %H:%M'), end_station: station, subscription_type: "Customer", zip_code: 12446, bike_id: 2)

      expected = {trip_1.start_date => condition_1,
                  trip_3.start_date => condition_2
                  }

      expect(Trip.trip_weather).to eq(expected)
    end
  end
end
