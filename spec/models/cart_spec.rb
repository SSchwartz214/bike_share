require 'rails_helper'

describe Cart do
  describe 'instance methods' do
    before :each do
      @cart = Cart.new({"1" => 2, "2" => 3})
    end
    it '#total_count' do
      expect(@cart.total_count).to eq(5)
    end
    it '#add_accessory' do
      @cart.add_accessory(1)
      @cart.add_accessory(2)

      expected = {"1" => 3, "2" => 4}
      expect(@cart.contents).to eq(expected)
    end

    it '#clear' do
      @cart.clear
      expect(@cart.contents.length).to eq(0)
    end
  end
end
