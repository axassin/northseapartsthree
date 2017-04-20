# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

  $('select#employee_id').selectize()

  current_employee_id = $('select#employee_id').val()
  default_date = $('input#end_attendance').val()

  $('#calendar').fullCalendar({
    defaultDate: default_date ,
    eventSources: [{
      url: 'employee_attendance_report/get_full_calendar_data',
      #url: 'http://localhost:3000/enterprise/human_resources/attendance/employee_attendance_report/get_full_calendar_data',
      data: {
        employee_id: current_employee_id
      },
      error: -> (alert ' Error has Occurred ; Please Contact Administrator'),
      allDay: false
    }]
  });