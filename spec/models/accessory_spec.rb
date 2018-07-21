require 'rails_helper'

describe Accessory, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:description)}
  end
  describe "Relationships" do
    it {should have_many(:order_accessories)}
    it {should have_many(:orders).through(:order_accessories)}
  end
end
