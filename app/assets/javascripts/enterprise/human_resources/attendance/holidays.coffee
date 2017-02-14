# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).ready( ->
  $('#new_holiday').submit( (event) ->

    implemented_at = $('#holiday_implemented_at').val()
    url = "holidays/unique_holiday_date?implemented_at=" + implemented_at
    ajax_validation_request(url, '#new_holiday','#holiday_implemented_at','Holiday on this Date already Declared')

  ))
