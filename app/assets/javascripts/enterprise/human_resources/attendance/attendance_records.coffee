# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).ready( ->
  $('#new_attendance_record').submit( (event) ->

    validity_token = false
    current_date = $('#attendance_record_current_date').val()
    time_out = (current_date + 'T' + $('#attendance_record_time_out').val())
    time_in = (current_date + 'T' + $('#attendance_record_time_in').val())
    employee_id = $('#attendance_record_employee_id').val()

    current_date_form = $('#attendance_record_current_date').parsley()
    window.ParsleyUI.removeError(current_date_form, "overlap_error");

    $.ajax "attendance_records/validate_overlap?date_time_in=" + time_in + "&date_time_out=" + time_out + "&employee_id=" + employee_id,
      type: 'GET'
      async: false
      dataType: 'text'
      error: (jqXHR, textStatus, errorThrown) ->
        window.ParsleyUI.addError(current_date_form, "overlap_error", 'Overlaps with a previous Attendance Record')
        event.preventDefault()
      success: (data, textStatus, jqXHR) ->
        validity_token = ('true' == data)
        if validity_token == true
          $('#new_attendance_record')[0].submit()
        else
          window.ParsleyUI.addError(current_date_form, "overlap_error", 'Overlaps with a previous Attendance Record')
          event.preventDefault()

  ))

window.Parsley
.addValidator('timeIn',
  {
    requirementType: 'string',
    validateString: (value, requirement) ->
                      validity_token = false
                      time_out = $('#attendance_record_time_out').val()
                      time_in = $('#attendance_record_time_in').val()
                      validity_token = true if time_in < time_out
                      return validity_token
                    ,
    messages: { en: 'Time in should be less than Time Out' }
  })

window.Parsley
.addValidator('timeOut',
  {
    requirementType: 'string',
    validateString: (value, requirement) ->
      validity_token = false
      time_out = $('#attendance_record_time_out').val()
      time_in = $('#attendance_record_time_in').val()
      validity_token = true if time_in < time_out
      return validity_token
    ,
    messages: { en: 'Time in should be less than Time Out' }
  })