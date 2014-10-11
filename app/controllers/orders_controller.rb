class OrdersController < ApplicationController

  before_action :get_goods, only: [:new, :create]

  def show
  # TODO : for future, to monitor order state
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @hash.each do |set|
      good = Good.find(set['id'])
      good.update_attribute(:count_in_stock, good.count_in_stock - 1)
      @order.order_goods << OrderGood.create(good: good, size: Size.where(name: set['size']).first)
    end

    if @order.save
      cookies['basket'] = ''
      redirect_to root_path, notice: t('order.add')
    else
      render :new
    end
  end

  private
    def get_goods
      @hash = cookies['basket'].blank? ? [] : JSON.parse(cookies['basket'])
      good_ids = @hash.map{|h| h['id']}
      @goods = Good.where(id: good_ids ).uniq
      @price = PriceCalculator.calculate_price(good_ids, @goods)
    end

    def order_params
      params.require(:order).permit(:name, :second_name, :family, :second_name, :city, :post_index, :street)
    end
end
