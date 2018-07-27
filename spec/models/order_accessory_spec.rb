require 'rails_helper'

describe OrderAccessory, type: :model do
  describe 'Relationships' do
    it {should belong_to(:order)}
    it {should belong_to(:accessory)}
  end

  describe 'instance methods' do
    it 'can return the subtotal' do
      user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")
      order = user.orders.create(status: "completed")
      accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)

      expect(order_accessory.subtotal).to eq(615)
    end
  end
end
