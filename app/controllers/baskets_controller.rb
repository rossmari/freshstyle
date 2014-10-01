class BasketsController < ApplicationController

  def index
    ids  = JSON.parse(cookies['basket'])
    @goods = Good.where(id: ids)
  end

end
