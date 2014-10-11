class BasketsController < ApplicationController
  def index
    @hash = cookies['basket'].blank? ? [] : JSON.parse(cookies['basket'])
    good_ids = @hash.map{|h| h['id']}

    @goods = Good.where(id: good_ids ).uniq
    @price = calculate_price(good_ids, @goods)

  end

  def calculate_price(goods_ids, goods)
    price = 0
    goods_by_count = goods_ids.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
    goods_by_count.each do |good_id, count|
      price = price + goods.select{|g| g.id = good_id}.first.price * count
    end
    return price
  end

end
