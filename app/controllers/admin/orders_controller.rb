class Admin::OrdersController < Admin::BaseController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_path, notice: t('order.remove')}
      format.json { head :no_content }
    end
  end

  def update_state
    order = Order.find(params[:id])
    order.update_attribute(:state, params[:state])
    respond_to do |format|
      format.html { redirect_to admin_orders_path, notice: t('order.state_sended', id: order.id)}
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

end
