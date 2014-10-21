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

    if @order.save
      @wrappers.each do |wrapper|
        good = wrapper.good
        size = Size.where(name: wrapper.size).first
        good.update_attribute(:count_in_stock, good.count_in_stock - 1)
        @order.order_goods << OrderGood.create(good: good, size: size)
      end

      cookies['basket'] = ''
      redirect_to root_path, notice: t('order.add')
    else
      render :new
    end
  end

  private

  def get_goods
    @processor = BasketProcessor.new(cookies['basket'])
    @wrappers = @processor.goods_wrappers.select { |w| w.exist }
  end

  def order_params
    params.require(:order).permit(:name, :second_name, :family, :second_name, :city, :post_index, :street, :phone, :email)
  end
end
