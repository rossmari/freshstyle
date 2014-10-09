class BasketsController < ApplicationController
  def index
    ids = cookies['basket'].blank? ? [] : JSON.parse(cookies['basket'])
    @goods = Good.where(id: ids)
  end
end
