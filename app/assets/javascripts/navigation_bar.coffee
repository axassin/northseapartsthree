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

  # --------------------- Main Menu Behaviour ---------------------
  $('.main_menu .menu_category').hide()
  $('.main_menu .enterprise').show()
  current_div = '.enterprise'

  $('.main_menu .sub_menu_button').click ->
    current_div = '.' + $(this).attr('unhide')
    $('.main_menu .menu_category').hide()
    $(current_div).velocity("fadeIn", { duration: 250 })

  # --------------------- Navigation Menu Controls --------------------

  # Initial Variables
  navigation_search_touch_flag = 0

  # Back Button
  $('.main_menu .back_menu_button').click ->
    if navigation_search_touch_flag == 1
      $('.main_menu .menu_cell').show()
      $('.main_menu .menu_category').hide()
      $('.main_menu .enterprise').show()
    else
      current_div = '.' + $('div.menu_category:visible').attr('data-parent-category')
      $('.main_menu .menu_category').hide()
      $(current_div).velocity("fadeIn", { duration: 250 })

  # Toggle Modules
  $('.main_menu .toggle_modules').funcToggle( 'click',
    ->
      if navigation_search_touch_flag == 1
        $('.main_menu .menu_cell').show()
        $('.main_menu .menu_category').show()
        $(this).html('BACK TO ROOT')
      else
        current_div = $('div.menu_category:visible').attr('class')
        current_div = current_div.replace('menu_category ', '');
        current_div = '.' + current_div
        $('.main_menu .menu_category').show()
        $(this).html('HIDE')
    ->
      if navigation_search_touch_flag == 1
        $('.main_menu .menu_cell').show()
        $('.main_menu .menu_category').hide()
        $('.main_menu .enterprise').show()
        $(this).html('SHOW ALL')
      else
        $('.main_menu .menu_category').hide()
        $(current_div).velocity("fadeIn", { duration: 250 })
        $(this).html('SHOW ALL')
  )

  # Navigation Menu Search Input
  $('.main_menu_controls input.navigation_menu_search').keydown ->
    navigation_search_touch_flag = 1
    control_value = $(this).val()
    $('.main_menu .menu_category').show()
    $('.main_menu .menu_cell').hide()
    if control_value == ''
      $('.main_menu .menu_cell').show()
    else
      control_value = control_value.toLowerCase();
      finder_div = ".main_menu div.menu_cell[data-text-label*='" + control_value + "']"
      $( finder_div ).show()

