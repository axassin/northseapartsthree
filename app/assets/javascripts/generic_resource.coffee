jQuery ($) ->
  $('#per_page').change ->
    per_page = $('#per_page').val()
    current_URI = URI(window.location.href)
    new_URI = current_URI.removeSearch('per_page').removeSearch('page').addSearch('per_page',per_page)
    window.location.href = new_URI