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
    if @carousel.save
      redirect_to admin_carousels_path, notice: 'Carousel was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carousel.update(carousel_params)
      @carousel.crop_image
      redirect_to admin_carousels_path, notice: 'Carousel was successfully updated.'
    else
      render :edit
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

  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  def carousel_params
    params.require(:carousel).permit(:header, :content_text, :main, :picture, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
