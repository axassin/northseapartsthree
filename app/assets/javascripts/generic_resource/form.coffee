alert 'fasfdas df a'

$(document).on 'turbolinks:load', ->

  # Disables all fields for 'show' action
  if action_name == 'show'
    $('.main_content form input').prop('disabled', true);
    $('.main_content form textarea').prop('disabled', true);
    $('.main_content form select').prop('disabled', true);

  # Polymorphic Selector
  $('.polymorphic_selector_group').each( (index, element) ->
    main_select = $(element).find('select')
    main_select.selectize();
  )

  # Contact Detail Selector
  $('.contact_detail_selector_group').each( (index, element) ->
    main_select = $(element).find('select')
    main_select.selectize();
  )

  # Model Selector
  $('.model_selector_group').each (index, element) ->
    main_select = $(element).find('select')
    main_select.selectize();


# Refreshes Model Selector
refresh_model_selector = (model_path, model_id, current_group) ->
  $.ajax
    url: '/' + model_path + '/retrieve_resource' + '?model_id=' + model_id
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{errorThrown}"
    success: (data, textStatus, jqXHR) ->
      for key, value of data
        division_key = '.current_model_' + key
        $(current_group).find(division_key).html(value)
        $(current_group).find('.attribute_display').show()
      if $(current_group).find('.selector_primary_image').length
        if data['primary_image']['url'] != null
          $(current_group).find('img.selector_primary_image').attr('src', data['primary_image']['url'])
          $(current_group).find('img.selector_primary_image').show()

# Refreshes ContactArticulation Selector
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

# validation request
ajax_validation_request = (url, form_id, attribute_id, error_message) ->
  $(form_id).submit( (event) ->

    validity_token = false
    attribute_object = $(attribute_id).parsley()
    window.ParsleyUI.removeError(attribute_object, "current_error");

    $.ajax url,
      type: 'GET'
      async: false
      dataType: 'text'
      error: (jqXHR, textStatus, errorThrown) ->
        window.ParsleyUI.addError(attribute_object, "current_error", error_message)
        event.preventDefault()
      success: (data, textStatus, jqXHR) ->
        validity_token = ('true' == data)
        if validity_token == true
          $(form_id)[0].submit()
        else
          window.ParsleyUI.addError(attribute_object, "current_error", error_message)
          event.preventDefault()
  )
