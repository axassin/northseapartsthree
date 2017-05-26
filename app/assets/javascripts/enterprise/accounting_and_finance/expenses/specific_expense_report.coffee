# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  expense_category_id = $('#expense_category_id').val()
  url = 'specific_expense_report/get_graph_data?expense_category_id=' + expense_category_id
  $.ajax url,
    type: 'GET'
    async: false
    dataType: 'text'
    error: (jqXHR, textStatus, errorThrown) ->
      alert errorThrown
      event.preventDefault()
    success: (data, textStatus, jqXHR) ->
      variable_one = 0