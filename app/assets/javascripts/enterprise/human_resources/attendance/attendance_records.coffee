# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

window.Parsley
.addValidator('dateOfAttendance',
  {
    requirementType: 'string',
    validateString: (value, requirement) ->
      validity_token = false
      date_of_attendance = $('#attendance_record_date_of_attendance').val()
      time_out = (date_of_attendance + 'T' + $('#attendance_record_time_out').val())
      time_in = (date_of_attendance + 'T' + $('#attendance_record_time_in').val())
      employee_id = $('#attendance_record_employee_id').val()

      $.ajax "attendance_records/validate_overlap?date_time_in=" + time_in + "&date_time_out=" + time_out + "&employee_id=" + employee_id,
        type: 'GET'
        dataType: 'text'
        error: (jqXHR, textStatus, errorThrown) ->
          alert errorThrown
          validity_token = false
        success: (data, textStatus, jqXHR) ->
          alert validity_token
          validity_token = ('true' == data)

      return validity_token
    ,
    messages: { en: 'Time Slot already occupied' }
  })

window.Parsley.addAsyncValidator('dateOfAttendance', (xhr) ->

  date_of_attendance = $('#attendance_record_date_of_attendance').val()
  time_out = (date_of_attendance + 'T' + $('#attendance_record_time_out').val())
  time_in = (date_of_attendance + 'T' + $('#attendance_record_time_in').val())
  employee_id = $('#attendance_record_employee_id').val()

, "attendance_records/validate_overlap?date_time_in=" + time_in + "&date_time_out=" + time_out + "&employee_id=" + employee_id);