class BasketsController < ApplicationController

  def index
    unless cookies['basket'].blank?
      ids  = JSON.parse(cookies['basket'])
    else
      ids = []
    end
    @goods = Good.where(id: ids)
  end

end
