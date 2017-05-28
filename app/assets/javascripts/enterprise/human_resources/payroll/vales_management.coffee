# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.vale_management_csv').click ->
    $('.vale_management_report_table').TableCSVExport
      delivery: 'download',
      filename: controller_name + '.csv'