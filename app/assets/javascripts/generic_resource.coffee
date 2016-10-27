jQuery ($) ->

  # Constants
  current_URI = URI(window.location.href)

  # Per Page Changer
  $('#per_page').change ->
    per_page = $('#per_page').val()
    new_URI = current_URI.removeSearch('per_page').removeSearch('page').addSearch('per_page',per_page)
    window.location.href = new_URI

  # Autosuggest
###  $('#search_query').change ->
    search_query = $('#search_query').val()
    callback = (response) -> suggestion_array = response; alert(suggestion_array);
    $.get window.location.href , {search_query}, callback, 'json'###

jQuery ($) ->
  class_model_data = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.whitespace('value')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: { url: window.location.href + '?search_query=%QUERY', wildcard: '%QUERY' })

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