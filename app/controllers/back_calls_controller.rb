class BackCallsController < ApplicationController

  def create
    @back_call = BackCall.new(back_call_params)

    respond_to do |format|
      if @back_call.save
        format.html { redirect_to new_feedback_path, notice: 'Back call created!' }
        format.json { render :show, status: :created, location: @back_call }
      else
        format.html { render :new }
        format.json { render json: @back_call.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def back_call_params
    params.require(:back_call).permit(:phone)
  end
end
