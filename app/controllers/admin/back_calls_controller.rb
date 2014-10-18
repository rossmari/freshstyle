class Admin::BackCallsController < Admin::BaseController

  before_action :set_back_call, only: [:show, :edit, :update, :destroy]

  def index
    @back_calls = BackCall.order('processed ASC').all
  end

  def show
  end

  def new
    @back_call = BackCall.new
  end

  def edit
  end

  def create
    @back_call = BackCall.new(back_call_params)

    respond_to do |format|
      if @back_call.save
        format.html { redirect_to admin_back_calls_path, notice: 'BackCall was successfully created.' }
        format.json { render :show, status: :created, location: @back_call }
      else
        format.html { render :new }
        format.json { render json: @back_call.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @back_call.processed = true
      if @back_call.update(back_call_params)
        format.html { redirect_to admin_back_calls_path, notice: 'BackCall was successfully updated.' }
        format.json { render :show, status: :ok, location: @back_call }
      else
        format.html { render :edit }
        format.json { render json: @back_call.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @back_call.destroy
    respond_to do |format|
      format.html { redirect_to admin_back_calls_path, notice: 'BackCall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_back_call
    @back_call = BackCall.find(params[:id])
  end

  def back_call_params
    params.require(:back_call).permit(:comment)
  end
end
