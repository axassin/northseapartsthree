jQuery ($) ->

  if action_name == 'show'
    $('.main_content form input').prop('disabled', true);
    $('.main_content form textarea').prop('disabled', true);

  # CONTACTABLE SELECTOR

  # Initialize
  contactable_selector = $('.contactable_selector')
  contactable_selector.selectize();

  # Refresh Preview
  contactable_selector.change ->
    refresh_contactable_preview( contactable_selector.val() )
  if contactable_selector.val() != ''
    refresh_contactable_preview( contactable_selector.val())

refresh_contactable_preview = ( contactable_id ) ->

  $.ajax
    url: "/enterprise/general_management/contact_details/contactable?id=" + contactable_id
    dataType: "text"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      $('img.contactable_image').attr('src', data)

  $('div.contactable_preview').show()