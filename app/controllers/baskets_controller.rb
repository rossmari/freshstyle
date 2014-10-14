class BasketsController < ApplicationController
  def index
    @processor = BasketProcessor.new(cookies['basket'])
  end

end
