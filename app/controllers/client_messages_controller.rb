class ClientMessagesController < ApplicationController

  def create
    @client_message = ClientMessage.new(clien_message_params)

    respond_to do |format|
      if @client_message.save
        format.html { redirect_to new_feedback_path, notice: 'Client message created' }
        format.json { render :show, status: :created, location: @client_message }
      else
        format.html { render :new }
        format.json { render json: @client_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def clien_message_params
    params.require(:client_message).permit(:email, :name, :content)
  end
end
