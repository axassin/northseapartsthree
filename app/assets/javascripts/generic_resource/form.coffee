jQuery ($) ->
  if action_name == 'show'
    $('input').prop('disabled', true);
    $('textarea').prop('disabled', true);

###  $('.delete_button_modal').click ->
    e.preventDefault();
    alert 'Are you sure you delete this item?'
    # $( "input[name='_method']" ).attr('value','delete')###
