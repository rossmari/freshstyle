class ClientMessagesController < ApplicationController

  def new
    @message = ClientMessage.new
  end

  def create
    @message = ClientMessage.new(client_message_params)

    if @message.save
      redirect_to [:new, :client_message], notice: t('client_message.created')
    else
      render :new
    end
  end

  private

  def client_message_params
    params.require(:client_message).permit(:email, :name, :content)
  end
end
