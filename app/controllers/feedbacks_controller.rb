class FeedbacksController < ApplicationController

  def new
    @back_call = BackCall.new
  end

  def create
    @back_call = BackCall.new(backcall_params)
    @message = Category.new(backcall_params)

    respond_to do |format|
      if @back_call.save || @message.save
        format.html { redirect_to @message, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def backcall_params
    params.require(:category).permit(:title)
  end
end
