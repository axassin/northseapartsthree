# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).ready( ->
  $('#new_attendance_record').submit( (event) ->

    implemented_on = $('#attendance_record_implemented_on').val()
    time_out = (implemented_on + 'T' + $('#attendance_record_time_out').val())
    time_in = (implemented_on + 'T' + $('#attendance_record_time_in').val())
    employee_id = $('#attendance_record_employee_id').val()
    url = "validate_overlap?date_time_in=" + time_in + "&date_time_out=" + time_out + "&employee_id=" + employee_id
    ajax_validation_request(url, '#new_attendance_record','#attendance_record_implemented_on','Overlap with a Previous Attendance Record')

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