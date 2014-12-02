class GoodsController < ApplicationController

  before_action :set_good, only: [:show]

  def index
    respond_to do |format|
      format.html do
        @filter = GoodsFilter.new(params)

        if @filter.category.root?
          @goods = @filter.root_category_goods
          render :root_index
        else
          @goods = @filter.search.order('updated_at DESC').paginate(page: params[:page])
          render :index
        end
      end
      format.xml do
        @goods = Good.all.includes(:brand, :origin_country, :design_country, :images)
        render layout: false
      end
    end
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
