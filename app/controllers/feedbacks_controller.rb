class FeedbacksController < ApplicationController
  def new
    @back_call = BackCall.new
    @message = ClientMessage.new
  end
end
