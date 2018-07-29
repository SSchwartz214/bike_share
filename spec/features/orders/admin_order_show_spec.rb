require 'rails_helper'

describe 'an admin visits the admin order show page' do
  it 'shows orders attributes' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)
    admin = User.create!(first_name: "keegan", last_name: "c", username: "admin", password: "oiajsiod", role: 1, address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    order = user.orders.create(status: "completed")

    accessory_1 = Accessory.create!(name: "oiad", price: 10, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    accessory_2 = Accessory.create!(name: "gfd", price: 20, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory_1 = order.order_accessories.create(quantity: 5, accessory_id: accessory_1.id)
    order_accessory_2 = order.order_accessories.create(quantity: 10, accessory_id: accessory_2.id)

    visit admin_order_path(order)

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.address)
    expect(page).to have_content(accessory_1.name)
    expect(page).to have_content(accessory_2.name)
    expect(page).to have_content(order_accessory_1.quantity)
    expect(page).to have_content(order_accessory_2.quantity)
    expect(page).to have_content(order_accessory_1.subtotal)
    expect(page).to have_content(order_accessory_2.subtotal)
    expect(page).to have_content(order.total)
    expect(page).to have_content(order.status)

    click_on accessory_1.name

    expect(current_path).to eq(accessory_path(accessory_1))
  end
end
