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

  # Turn page into a printable
  $('.printable_form').click ->
    resource_navigation = $('.resource_navigation')
    $('.grid-item').css('position','static')
    $( '.resource_navigation' ).empty();
    jQuery ($) -> alert('Page will be optimized for printing. You may print on your device once you press OK.')
    # $('body').html(resource_navigation)

  # Add form modal
  $('.add_form_modal_button').click ->
    event.preventDefault()
    $('.add_form_modal').modal('show')
###
    $('.add_form_modal').on('shown.bs.modal', ->
      $(this).find('.modal-body').css({ width:'auto', height:'auto', 'max-height':'95%'})
    )
###

# Modifies params then refreshes the page for a modified query
query_modifiers = (query_element, current_URI) ->
  $('#' + query_element).change ->
    per_page = $('#' + query_element).val()
    new_URI = current_URI.removeSearch(query_element).addSearch(query_element,per_page)
    window.location.href = new_URI