class MainController < ApplicationController
  def index
    @carousels = Carousel.all
    @main_offers = Good.main_offers
    @categories = Category.roots.order(:name)
  end
end