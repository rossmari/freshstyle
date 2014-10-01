class MainController < ApplicationController
  def index
    @carousels = Carousel.all
    @main_offers = MainOffer.all
    @categories = Category.all
  end
end