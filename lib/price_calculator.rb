class PriceCalculator

  def self.calculate_price(goods_ids, goods)
    price = 0
    goods_by_count = goods_ids.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
    goods_by_count.each do |good_id, count|
      price = price + goods.select{|g| g.id = good_id}.first.price * count
    end
    return price
  end

end