$(document).on 'turbolinks:load', ->

  $('.main_menu').hide()
  $('span.main_menu_arrow').hide()

  $('.menu_button').funcToggle( 'click',
    ->
      $('.main_menu').velocity("fadeIn", { duration: 250 })
      $('.main_menu_arrow').velocity("fadeIn", { duration: 250 })
      $('.main_display').velocity({ opacity: 0.25 }, { duration: 250 })
    ->
      $('.main_menu').velocity("fadeOut", { duration: 250 })
      $('.main_menu_arrow').velocity("fadeOut", { duration: 250 })
      $('.main_display').velocity({ opacity: 1 }, { duration: 250 })
  )

  $('.main_menu > .menu_category > .menu_category').hide()

  $('.sub_menu_button').click ->
    target_div = '.' + $('.sub_menu_button').attr('unhide')
    alert target_div
    # $('.main_menu > .menu_category').hide()
    $('.' + target_div).show()
