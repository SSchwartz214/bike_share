require 'rails_helper'

describe 'a user visits their cart' do
  it 'shows the image, title, and price' do
    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    cart = Cart.new(Hash.new(0))
    cart.add_accessory(accessory.id)
    allow(Cart).to receive(:new).and_return(cart)

    visit cart_path

    expect(page).to have_content(accessory.name)
    expect(page).to have_content(accessory.price)
  end

  it 'checks them out' do
    user_1 = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    cart = Cart.new(Hash.new(0))
    cart.add_accessory(accessory.id)
    allow(Cart).to receive(:new).and_return(cart)

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Successfully submitted your order totalling $#{cart.total([accessory])}")
  end
end
