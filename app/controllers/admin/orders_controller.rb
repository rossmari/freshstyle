class Admin::OrdersController < Admin::BaseController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  # def edit
  # end

  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to admin_orders_path, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Good.find(params[:id])
  end

  def order_params
    params.require(:order).permit()
  end
end
