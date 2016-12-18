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

  # Model Selector
  $('.model_select_group').each (index, element) =>
    main_select = $(element).find('select')
    model_path = $(element).find("input[type='hidden'].model_path").val()
    main_select.selectize();
    main_select.change ->
      refresh_model_selector(model_path, main_select.val(), element)
    if main_select.val() != ''
      refresh_model_selector(model_path, main_select.val(), element)


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
