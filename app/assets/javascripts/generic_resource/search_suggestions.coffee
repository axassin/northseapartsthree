jQuery ($) ->

# Search Suggestions
  class_model_data = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.whitespace('value')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: { url: base_url + '/' + controller_path + '/search_suggestion?search_query=%QUERY', wildcard: '%QUERY' })

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