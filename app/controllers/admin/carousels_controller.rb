class Admin::CarouselsController < Admin::BaseController

  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  def index
    @carousels = Carousel.all
  end

  def show
  end

  def new
    @carousel = Carousel.new
  end

  def edit
  end

  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to admin_carousels_path, notice: 'Carousel was successfully created.' }
        format.json { render :show, status: :created, location: @carousel }
      else
        format.html { render :new }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to admin_carousels_path, notice: 'Carousel was successfully updated.' }
        format.json { render :show, status: :ok, location: @carousel }
      else
        format.html { render :edit }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to admin_carousels_path, notice: 'Carousel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_brand
    @carousel = Carousel.find(params[:id])
  end

  def carousel_params
    params.require(:carousel).permit(:header, :content_text, :picture)
  end
end
