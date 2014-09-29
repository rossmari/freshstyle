class MainController < ApplicationController

  def index
    @carousels = Carousel.all
    @main_offers = MainOffer.all
    @categories = Category.all
    render layout: false
  end

end