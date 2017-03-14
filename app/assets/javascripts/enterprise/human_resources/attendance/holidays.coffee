# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).ready( ->
  $('#new_holiday').submit( (event) ->

    implemented_on = $('#holiday_implemented_on').val()
    url = "holidays/unique_holiday_date?implemented_on=" + implemented_on
    ajax_validation_request(url, '#new_holiday','#holiday_implemented_on','Holiday on this Date already Declared')

  ))
