$(document).on 'turbolinks:load', ->

  # Constants
  current_URI = URI(window.location.href)

  # Hide Options based on Item Cell Hover State
  $('.resource_item_options').css('visibility', 'hidden')
  $('.grid-item').hover(
    ->
      $(this).find('div.resource_item_options').css('visibility', 'visible')
    ->
      $(this).find('div.resource_item_options').css('visibility', 'hidden')
  )
  $('table.resource_table > tbody > tr').hover(
    ->
      $(this).find('div.resource_item_options').css('visibility', 'visible')
    ->
      $(this).find('div.resource_item_options').css('visibility', 'hidden')
  )

  # Query Modifiers
  query_modifiers('view_mode', current_URI)
  query_modifiers('order_by', current_URI)
  query_modifiers('sort_by', current_URI)
  query_modifiers('per_page', current_URI)

  # Reset Parameters
  $('#generic_resource_reset').click ->
    window.location = remove_all_params(window.location.href)

  # Modal Stuff
  $('#add_form_modal').on('shown.bs.modal', ->
    $('.modal-body').css('height','auto')
  )

# Printable Form Cycle
  $('.printable_form').click ->
    window.location =  URI(window.location.href).addSearch("printable", "true")

  $('.export_to_csv').click ->
    $('.resource_table').TableCSVExport
      delivery: 'download',
      filename: controller_name + '.csv'

# Modifies params then refreshes the page for a modified query
query_modifiers = (query_element, current_URI) ->
  $('#' + query_element).change ->
    per_page = $('#' + query_element).val()
    new_URI = current_URI.removeSearch(query_element).addSearch(query_element,per_page)
    window.location.href = new_URI

# Remove all the parameters
remove_all_params = (url) ->
  oldURL = url
  index = 0
  newURL = oldURL
  index = oldURL.indexOf('?')

  if(index == -1)
    index = oldURL.indexOf('#')

  if(index != -1)
    newURL = oldURL.substring(0, index)

  newURL