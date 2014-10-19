class GoodsController < ApplicationController

  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    @filter = GoodsFilter.new(params)
    @goods = @filter.search.order('updated_at DESC').paginate(page: params[:page])
  end

  def show
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def create
    @good = Good.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to admin_goods_path, notice: t('good.add') }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to admin_goods_path, notice: t('good.update') }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to admin_goods_path, notice: t('good.remove') }
      format.json { head :no_content }
    end
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
                                 {size_ids: []},
                                 :season,
                                 :brand_id,
                                 :consist,
                                 :origin_country_id,
                                 :design_country_id,
                                 :count_in_stock,
                                 :price, :percents_discount, :monetary_discount)
  end
end
