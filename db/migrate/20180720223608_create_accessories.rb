class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :name
      t.integer :price
      t.integer :status, default: 0
      t.string :image_url
      t.string :description
    end
  end
end
