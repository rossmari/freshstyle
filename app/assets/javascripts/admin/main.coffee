$ ->
  $("a").tooltip()

  $(document).on "change", "input.radio-box", (event) ->
    $("input.radio-box[id!='#{$(event.currentTarget).attr('id')}']").prop "checked", false