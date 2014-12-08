$ ->
  $(".big_image img").elevateZoom
    gallery: "gallery"
    zoomType: "inner"
#    zoomWindowPosition: 1
#    zoomWindowOffetx: 10
    cursor: "zoom-in"
    galleryActiveClass: "active"
    imageCrossfade: true
    loadingIcon: "http://www.elevateweb.co.uk/spinner.gif"

  $(".big_image img").on "click", (event) ->
    event.preventDefault()
    $.fancybox $(event.currentTarget).data("elevateZoom").getGalleryList()