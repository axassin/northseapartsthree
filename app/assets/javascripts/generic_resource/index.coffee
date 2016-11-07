jQuery ($) ->

  # Constants
  current_URI = URI(window.location.href)

  # Query Modifiers
  query_modifiers('view_mode', current_URI)
  query_modifiers('order_by', current_URI)
  query_modifiers('sort_by', current_URI)
  query_modifiers('per_page', current_URI)

  # Reset Parameters
  $('#generic_resource_reset').click ->
    window.location = window.location.pathname + window.location.hash;

  # Reset Parameters
  $('.printable_form').click ->
    resource_display = $('.resource_display')
    $( 'body' ).empty();
    $('body').html(resource_display)

query_modifiers = (query_element, current_URI) ->
  $('#' + query_element).change ->
    per_page = $('#' + query_element).val()
    new_URI = current_URI.removeSearch(query_element).addSearch(query_element,per_page)
    window.location.href = new_URI