jQuery ($) ->
  if action_name == 'show'
    $('.main_content form input').prop('disabled', true);
    $('.main_content form textarea').prop('disabled', true);

###  $('.delete_button_modal').click ->
    e.preventDefault();
    alert 'Are you sure you delete this item?'
    # $( "input[name='_method']" ).attr('value','delete')###
