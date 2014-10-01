class Admin::MainOffersController < Admin::BaseController

  before_action :set_main_offer, only: [:show, :edit, :update, :destroy]

  def index
    @main_offers = MainOffer.all
  end

  def show
  end

  def new
    @main_offer = MainOffer.new
  end

  def edit
  end

  def create
    @main_offer = MainOffer.new(main_offer_params)

    respond_to do |format|
      if @main_offer.save
        format.html { redirect_to admin_main_offers_path, notice: 'Main Offer was successfully created.' }
        format.json { render :show, status: :created, location: @main_offer }
      else
        format.html { render :new }
        format.json { render json: @main_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @main_offer.update(main_offer_params)
        format.html { redirect_to admin_main_offers_path, notice: 'Main Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_offer }
      else
        format.html { render :edit }
        format.json { render json: @main_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @main_offer.destroy
    respond_to do |format|
      format.html { redirect_to admin_main_offers_path, notice: 'Main Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_main_offer
    @main_offer = MainOffer.find(params[:id])
  end

  def main_offer_params
    params.require(:main_offer).permit(:header, :content_text, :picture)
  end
end
