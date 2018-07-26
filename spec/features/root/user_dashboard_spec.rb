require 'rails_helper'

describe 'a user visits the user dashboard' do
  it 'shows a list of orders' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create(status: "completed")

    visit dashboard_path

    expect(page).to have_content("Order ID: #{order.id}")
  end

  it 'takes me to the order show page' do
    user = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create(status: "completed")

    visit dashboard_path

    click_on "#{order.id}"

    expect(current_path).to eq(order_path(order))
  end
end
