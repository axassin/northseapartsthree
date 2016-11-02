

jQuery ($) ->

  # Constants
  current_URI = URI(window.location.href)

  # Query Modifiers
  query_modifiers('view_mode', current_URI)
  query_modifiers('order_by', current_URI)
  query_modifiers('sort_by', current_URI)
  query_modifiers('per_page', current_URI)

  # Search Suggestions
  class_model_data = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.whitespace('value')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: { url: base_url + '/' + controller_path + '/search_suggestions?search_query=%QUERY', wildcard: '%QUERY' })

  class_model_data.initialize()

  $('#search_query').typeahead({
      hint: true,
      highlight: true,
      minLength: 3
    },
    {
      name: 'class_model_data',
      source: class_model_data.ttAdapter()
    });

  # Reset Parameters
  $('#generic_resource_reset').click ->
    window.location = window.location.pathname + window.location.hash;

  # Initialize Grid - Packery
  $grid = $('.grid').packery({
    itemSelector: '.grid-item',
    gutter: 10
  });

  current_grid.find('.grid-item').each = (i, gridItem) ->
    draggie = new Draggabily(gridItem)
    $grid.packery( 'bindDraggabillyEvents', draggie );

query_modifiers = (query_element, current_URI) ->
  $('#' + query_element).change ->
    per_page = $('#' + query_element).val()
    new_URI = current_URI.removeSearch(query_element).addSearch(query_element,per_page)
    window.location.href = new_URI