class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    unless cookies['basket'].blank?
      ids  = JSON.parse(cookies['basket'])
    else
      ids = []
    end
    goods = Good.where(id: ids)
    @order = Order.new(goods: goods)
  end

  def create
    unless cookies['basket'].blank?
      ids  = JSON.parse(cookies['basket'])
    else
      ids = []
    end
    goods = Good.where(id: ids)
    @order = Order.new(order_params)
    @order.goods = goods
    if @order.save
      cookies['basket'] = ''
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :second_name, :family, :second_name, :city, :post_index, :street)
    end
end
