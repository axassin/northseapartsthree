# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#generate_printable_voucher').click ->
    win = window.open '', '_blank'
    printable_expense_voucher = $('div.printable_expense_voucher').html()
    $(win.document.body).html(printable_expense_voucher)