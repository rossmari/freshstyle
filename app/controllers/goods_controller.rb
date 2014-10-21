class GoodsController < ApplicationController

  before_action :set_good, only: [:show]

  def index
    @filter = GoodsFilter.new(params)
    @goods = @filter.search.order('updated_at DESC').paginate(page: params[:page])
  end

  def show
  end

  def sale
    @sales = Good.on_sale
  end

  def gifts
    @gifts = Good.gifts
  end

  private

  def set_good
    @good = Good.find(params[:id])
  end
end
