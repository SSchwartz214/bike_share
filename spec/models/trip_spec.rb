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

  describe "instance methods" do
    describe ".start_station_name" do
      it "returns start station name" do
        station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
        station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

        trip_1 = Trip.create!(duration: 123, start_date: "8/29/2013 14:13", start_station_id: station_1.id, end_date: "8/29/2013 14:14", end_station_id: station_2.id, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

        expect(trip_1.start_station_name).to eq(station_1.name)
      end
    end
  end
end
