class ChangeDatetimeToDateConditions < ActiveRecord::Migration[5.1]
  def change
    change_column :conditions, :date, :date
  end
end
