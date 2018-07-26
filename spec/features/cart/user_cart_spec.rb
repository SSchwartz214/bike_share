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

  it 'shows a subtotal and quantity breakdown for each item' do
    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    cart = Cart.new(Hash.new(0))
    allow(Cart).to receive(:new).and_return(cart)
    cart.add_accessory(accessory.id)
    cart.add_accessory(accessory.id)

    visit cart_path

    expect(page).to have_content(cart.subtotal(accessory))
    expect(page).to have_content(cart.contents[accessory.id.to_s])
  end

  it 'shows the total price for your cart' do
    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    accessory_2 = Accessory.create!(name: "efiji", price: 222, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    cart = Cart.new(Hash.new(0))
    allow(Cart).to receive(:new).and_return(cart)
    cart.add_accessory(accessory.id)
    cart.add_accessory(accessory.id)
    cart.add_accessory(accessory_2.id)

    visit cart_path

    expect(page).to have_content(cart.total([accessory, accessory_2]))
  end

  it 'has a checkout button' do
    accessory = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    accessory_2 = Accessory.create!(name: "efiji", price: 222, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    cart = Cart.new(Hash.new(0))
    allow(Cart).to receive(:new).and_return(cart)
    cart.add_accessory(accessory.id)
    cart.add_accessory(accessory.id)
    cart.add_accessory(accessory_2.id)

    visit cart_path

    expect(page).to have_link('Checkout')
  end
end
