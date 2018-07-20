class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.string :end_date
      t.integer :max_temperature
      t.integer :mean_temperature
      t.integer :min_temperature
      t.integer :mean_humididity
      t.integer :mean_visibility
      t.integer :mean_wind_speed
      t.integer :precipitation
    end
  end
end
