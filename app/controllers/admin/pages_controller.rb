class Admin::PagesController < Admin::BaseController

  before_action :set_page, only: [:show, :edit, :update, :destroy, :update_row_order]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_row_order
    @page.row_order_position = page_params[:row_order_position]
    @page.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :row_order_position, :meta_tags, :meta_title)
  end
end
