$(document).on 'turbolinks:load', ->

  # Disables all fields for 'show' action
  if action_name == 'show'
    $('.main_content form input').prop('disabled', true);
    $('.main_content form textarea').prop('disabled', true);
    $('.main_content form select').prop('disabled', true);

  # CONTACTABLE SELECTOR
  # Initialize
  contactable_selector_select = $('.contactable_selector_select')
  contactable_selector_select.selectize();

  # Refresh Preview
  contactable_selector_select.change ->
    refresh_contactable_select( contactable_selector_select.val() )
  if contactable_selector_select.val() != ''
    refresh_contactable_select( contactable_selector_select.val())


# Refreshes Contactable Selector
refresh_contactable_select = ( contactable_id ) ->

  $.ajax
    url: "/enterprise/general_management/contact_details/contactable?id=" + contactable_id
    dataType: "text"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      $('img.contactable_element').hide()
      if data != '' || data != null || data != undefined
        $('img.contactable_element').attr('src', data)
        $('img.contactable_element').show()