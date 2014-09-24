class Admin::SizesController < Admin::BaseController

  before_action :set_size, only: [:show, :edit, :update, :destroy]

  def index
    @sizes = Size.all
  end

  def show
  end

  def new
    @size = Size.new
  end

  def edit
  end

  def create
    @size = Size.new(size_params)

    respond_to do |format|
      if @size.save
        format.html { redirect_to admin_sizes_path, notice: 'Size was successfully created.' }
        format.json { render :show, status: :created, location: @size }
      else
        format.html { render :new }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to admin_sizes_path, notice: 'Size was successfully updated.' }
        format.json { render :show, status: :ok, location: @size }
      else
        format.html { render :edit }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @size.destroy
    respond_to do |format|
      format.html { redirect_to admin_sizes_path, notice: 'Size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_size
    @size = Size.find(params[:id])
  end

  def size_params
    params.require(:size).permit(:name)
  end
end
