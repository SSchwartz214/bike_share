class ChangePreciptationAndWindToFloats < ActiveRecord::Migration[5.1]
  def change
    change_column :conditions, :precipitation_inches, :float
  end
end
