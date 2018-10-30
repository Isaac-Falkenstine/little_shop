class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_item(item_id)
    if @contents[item_id.to_s] != nil
      @contents[item_id.to_s] += 1
    else
      @contents[item_id.to_s] = 1
    end
  end

  def count_of(item_id)
    @contents[item_id.to_s].to_i
  end

  def total_price
    items_price_array = self.contents.map do |item_id, quantity|
      Item.find(item_id).price * quantity
    end.sum
  end
end
