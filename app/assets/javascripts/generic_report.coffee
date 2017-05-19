# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

  # Report Model Selector
  $('.generic_selector_group').each (index, element) ->
    main_select = $(element).find('select')
    main_select.selectize();