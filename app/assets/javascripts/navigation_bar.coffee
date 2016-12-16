$(document).on 'turbolinks:load', ->

  $('.main_menu').hide()
  $('.menu_button').funcToggle( 'click',
    ->
      $('.main_menu').velocity("fadeIn", { duration: 250 })
      $('.main_display').velocity({ opacity: 0.25 }, { duration: 250 })
    ->
      $('.main_menu').velocity("fadeOut", { duration: 250 })
      $('.main_display').velocity({ opacity: 1 }, { duration: 250 })
  )

  $('a.main_menu_link').hover(
    ->
      $(this).css('background-color','gray')
      $(this).css('color','white')
    ->
      $(this).css('background-color', 'transparent')
      $(this).css('color', 'inherit')
  )