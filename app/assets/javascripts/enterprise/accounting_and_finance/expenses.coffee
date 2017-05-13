# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.hierarchy_option_button').funcToggle( 'click',
    ->
      $(this).html('&#9660;')
      account_id = $(this).data( "account_id" )
      $(".expense_cell[data-parent_id='" + account_id + "']").show()
    ->
      $(this).html('&#9654;')
      account_id = $(this).data( "account_id" )
      $(".expense_cell[data-parent_id='" + account_id + "']").hide()
  )