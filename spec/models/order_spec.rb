require 'rails_helper'

describe Order, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:status)}
  end
  describe "Relationships" do
    it {should belong_to(:user)}
    it {should have_many(:order_accessories)}
    it {should have_many(:accessories).through(:order_accessories)}
  end

  describe 'instance methods' do
    it 'returns the total' do
      user = User.create!(first_name: "wfdsx", last_name: "c", username: "redfscx", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

      order = user.orders.create(status: "completed")

      accessory = Accessory.create!(name: "oiad", price: 3, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      accessory_2 = Accessory.create!(name: "dewdw", price: 2, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")


      order_accessory_1 = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)
      order_accessory_2 = order.order_accessories.create(quantity: 10, accessory_id: accessory_2.id)


      expect(order.total).to eq(35)
    end
  end
  describe 'class methods' do
    it '.group_by_status' do
      user = User.create!(first_name: "wfdsx", last_name: "c", username: "redfscx", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

      order_1 = user.orders.create!(status: "ordered")
      order_2 = user.orders.create!(status: "paid")
      order_3 = user.orders.create!(status: "cancelled")
      order_4 = user.orders.create!(status: "completed")

      accessory = Accessory.create!(name: "oiad", price: 3, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      order_accessory_1 = order_1.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_2 = order_2.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_3 = order_3.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_4 = order_4.order_accessories.create!(quantity: 5, accessory_id: accessory.id)

      expected = { "ordered" => 1,
                  "paid" => 1,
                  "cancelled" => 1,
                  "completed"=> 1
                  }

      expect(Order.group_by_status).to eq(expected)
    end
  end

end
