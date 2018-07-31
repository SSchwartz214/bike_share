class Cart
  attr_reader :contents, :last_removed, :last_removed_name

  def initialize(content)
    @contents = content || Hash.new(0)
    @last_removed = @contents["last_removed"].to_i
    @last_removed_name = @contents["last_removed_name"]
    @contents.delete("last_removed")
    @contents.delete("last_removed_name")
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
      if key.to_i.to_s == key
        contents[key] = totals[key].to_i
      end
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

  def remove_accessory(id)
    contents.delete(id)
  end

  def clear
    contents.clear
  end
end
