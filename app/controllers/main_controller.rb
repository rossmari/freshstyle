class MainController < ApplicationController

  def index
    @carousels = Carousel.all
    @main_offers = MainOffer.all
  end

end