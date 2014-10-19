class GoodsController < ApplicationController

  before_action :set_good, only: [:show, :edit, :update, :destroy]

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

  def good_params
    params.require(:good).permit(:title,
                                 :color,
                                 :article,
                                 { size_ids: [] },
                                 :season,
                                 :brand_id,
                                 :consist,
                                 :origin_country_id,
                                 :design_country_id,
                                 :count_in_stock,
                                 :price, :percents_discount, :monetary_discount)
  end
end
