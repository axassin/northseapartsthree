$(document).on 'turbolinks:load', ->

  $('.main_menu').hide()
  $('.menu_button').click ->
    $('.main_menu').slideToggle()