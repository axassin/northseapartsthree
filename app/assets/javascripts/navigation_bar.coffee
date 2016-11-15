jQuery ($) ->

  $('.main_menu').hide()
  $('.menu_button').click ->
    $('.main_menu').slideToggle()