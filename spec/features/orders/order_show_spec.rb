require 'rails_helper'

describe 'a user visits the order show page' do
  it 'shows the subtotal and quantity for each accessory' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create(status: "completed")

    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)

    visit order_path(order)

    expect(page).to have_content(order_accessory.subtotal)
    expect(page).to have_content(order_accessory.quantity)
  end

  it 'shows the total, status, and when it was submitted' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create

    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)

    visit order_path(order)


    expect(page).to have_content(order.total)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.created_at)
  end

  it 'wont show another user show' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)
    user_2 = User.create!(first_name: "wef", last_name: "ewf", username: "ojfebwojb", password: "wf", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

    order = user_2.orders.create()
    accessory = Accessory.create(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id, order_id: order.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(order)

    expect(page).to_not have_content(accessory.name)
  end
end
