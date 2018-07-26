class Cart
  attr_reader :contents

  def initialize(content)
    @contents = content || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_accessory(accessory_id)
    @contents[accessory_id.to_s] ||= 0
    @contents[accessory_id.to_s] += 1
  end

  def update_totals(totals)
    totals.keys.each do |key|
      contents[key] = totals[key].to_i
    end
  end

  def subtotal(accessory)
    accessory.price * @contents[accessory.id.to_s]
  end

  def total(accessories)
    accessories.inject(0) {|sum, accessory| sum += subtotal(accessory)}
  end

  def accessories
    @contents.keys.map do |key|
      key.to_i
    end
  end
end
