class MainController < ApplicationController

  def index
    @carousels = Carousel.all
  end

end