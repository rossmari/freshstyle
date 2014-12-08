class Admin::GoodImagesController < Admin::BaseController

  def show
    @images = Good.find(params[:id]).images
  end

  def edit
    @good = Good.find(params[:id])
    @good.images.any? || @good.images.build
  end

  def update
    @good = Good.find(params[:good][:id])

    if @good.update(images_params)
      redirect_to admin_goods_path, notice: t('good.update')
    else
      render :edit
    end
  end

  private

  def images_params
    params.require(:good).permit(:id, images_attributes: [:id, :_destroy, :main_image, :picture])
  end
end
