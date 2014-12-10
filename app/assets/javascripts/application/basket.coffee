$ ->
  Cookies.defaults =
    path: '/'
    expires: 172800

  addToBasket = (good_id, size) ->
    localBasket.push
      id: good_id
      size: size
    writeBasket()

  removeFromBasket = (good_id, size) ->
    index = -1
    $.each localBasket, (i, element) ->
      index = i if element["id"] is good_id and element["size"] is size

    if index > -1
      localBasket.splice index, 1
      location.reload()

    writeBasket()
    location.reload()

  writeBasket = ->
    Cookies.set "basket", JSON.stringify(localBasket)

  check_goods_count = (good_id) ->
    goods = $.grep(localBasket, (a) ->
      a["id"] is good_id
    )
    goods.length < $("#goods_count_in_stock").val()

  updateCounter = ->
    $(".basket_count_label").text localBasket.length

  clearBasket = ->
    Cookies.set "basket", JSON.stringify([])

  readBasket = ->
    clearBasket() if not Cookies.get("basket")? or Cookies.get("basket") is ""
    JSON.parse Cookies.get("basket")

  $(document).on "click", ".add_good_to_basket", (event) ->
    event.preventDefault()

    sizeAlertBlock = $("#size_alert")
    goodId = $(event.currentTarget).data("good-id")

    if $(".sizes .active").length < 1
      sizeAlertBlock.show()
      return
    else
      size = $(".sizes .active input").val()
      sizeAlertBlock.hide()


    if check_goods_count(goodId)
      addToBasket goodId, size
      updateCounter()

      alert "Товар добавлен в корзину!"
    else
      alert "Товар не добавлен в корзину!\nКоличество товара на складе ограничено!"

  $(document).on "click", ".remove_good_from_basket", (event) ->
    event.preventDefault()

    target = $(event.currentTarget)
    good_id = target.data("good-id")
    size = target.parent().find(".size").data("size")
    removeFromBasket good_id, size

  $(document).on "click", ".clear_basket", (event) ->
    event.preventDefault()
    clearBasket()
    location.reload()

  localBasket = readBasket()
  updateCounter()
