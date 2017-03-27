# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->

  $('#greco_transaction_greco_item_id').change ->
    $.ajax
      url: 'greco_transactions/last_transactions' + '?greco_item_id=' + $('#greco_transaction_greco_item_id').val()
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "AJAX Error: #{errorThrown}"
      success: (data, textStatus, jqXHR) ->
        for key, value of data
          alert (key + value)