require 'rails_helper'

describe 'a user visits the order show page' do
  it 'shows the subtotal and quantity for each accessory' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create(status: "completed")

    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)

    visit order_path(order)

    expect(page).to have_content(order_accessory.subtotal)
    expect(page).to have_content(order_accessory.quantity)
  end

  it 'shows the total, status, and when it was submitted' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create

    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id)

    visit order_path(order)


    expect(page).to have_content(order.total)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.created_at)
  end
end
