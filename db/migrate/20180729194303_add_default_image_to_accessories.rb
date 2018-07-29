class AddDefaultImageToAccessories < ActiveRecord::Migration[5.1]
  def change
    change_column :accessories, :image_url, :string, default: "https://upload.wikimedia.org/wikipedia/commons/6/63/French_horn_front.png"
  end
end
