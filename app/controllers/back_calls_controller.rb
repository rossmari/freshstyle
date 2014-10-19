class BackCallsController < ApplicationController

  def new
    @back_call = BackCall.new
  end

  def create
    @back_call = BackCall.new(back_call_params)

    if @back_call.save
      redirect_to [:new, :back_call], notice: t('back_call.created')
    else
      render :new
    end
  end

  private

  def back_call_params
    params.require(:back_call).permit(:phone)
  end
end
