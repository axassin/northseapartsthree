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

  # --------------------- Menu Option ---------------------
  # Default Condition
  $('.main_menu > .menu_category').hide()
  $('.main_menu > .enterprise').show()

  $('.sub_menu_button').click ->
    target_div = '.' + $(this).attr('unhide')
    $('.main_menu > .menu_category').hide()
    $(target_div).velocity("fadeIn", { duration: 250 })

  # --------------------- Menu Option ---------------------
  # Default Condition