class MainController < ApplicationController
  def index
    @carousels = Carousel.all
    @main_offers = MainOffer.all
    @categories = Category.roots.order(:name)
  end
end