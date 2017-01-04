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

  $("div.main_menu a[href='" + main_resource_path + "']")
    .prepend(' 	&#8594; ')
    .css('background-color','#666666')
    .css('color','white')