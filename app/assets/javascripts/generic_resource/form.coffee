$(document).on 'turbolinks:load', ->

  # Disables all fields for 'show' action
  if action_name == 'show'
    $('.main_content form input').prop('disabled', true);
    $('.main_content form textarea').prop('disabled', true);
    $('.main_content form select').prop('disabled', true);

  # CONTACTABLE SELECTOR
  if $('.contactable_selector_select').length
    # Initialize
    contactable_selector_select = $('.contactable_selector_select')
    contactable_selector_select.selectize();
    # Refresh Preview
    contactable_selector_select.change ->
      refresh_contactable_select( contactable_selector_select.val() )
    if contactable_selector_select.val() != ''
      refresh_contactable_select( contactable_selector_select.val())

  # SYSTEM ACCOUNT SELECTOR
  if $('.system_account_select').length
  # Initialize
    system_account_select = $('.system_account_select')
    system_account_select.selectize();
    # Refresh Preview
    system_account_select.change ->
      refresh_system_account_select( system_account_select.val() )
    if system_account_select.val() != ''
      refresh_system_account_select( system_account_select.val())

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
        if data == ''
          $('img.contactable_element').hide()

# Refreshes System Account Select
refresh_system_account_select = ( system_account_id ) ->
  $.ajax
    url: "/enterprise/system_account/get_image?id=" + system_account_id
    dataType: "text"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{errorThrown}"
    success: (data, textStatus, jqXHR) ->
      $('img.system_account_primary_image').hide()
      if data != '' || data != null || data != undefined
        $('img.system_account_primary_image').attr('src', data)
        $('img.system_account_primary_image').show()
        if data == ''
          $('img.system_account_primary_image').hide()

