class AddStationToTrips < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :trips, :stations, column: :start_station_id, primary_key: :id
    add_foreign_key :trips, :stations, column: :end_station_id, primary_key: :id
  end
end
