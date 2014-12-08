$ ->
  $(".preview").on "click", (event) ->
    event.preventDefault()
    event.stopPropagation()

    $(".big_image").find("img").attr "src", $(this).data("big")

  $(".fancybox").fancybox()
