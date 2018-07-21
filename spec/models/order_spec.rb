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
end
