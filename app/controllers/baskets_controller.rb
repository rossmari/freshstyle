class BasketsController < ApplicationController
  def index
    @hash = cookies['basket'].blank? ? [] : JSON.parse(cookies['basket'])
    good_ids = @hash.map{|h| h['id']}

    @goods = Good.where(id: good_ids ).uniq
    @price = PriceCalculator.calculate_price(good_ids, @goods)
  end

end
