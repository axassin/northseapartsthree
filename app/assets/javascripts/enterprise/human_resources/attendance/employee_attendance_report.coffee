# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

  $('select.employee_id_attendance_report').selectize()

  employee_id = $('select.employee_id_attendance_report').val()

  for current_timeline in $('div.timeline')
    attendance_date = current_timeline.getAttribute("data-parsley-date")

    data_set = []
    $.ajax
      url: 'employee_attendance_report/get_attendance_records' + '?attendance_date=' + attendance_date + '&employee_id=' + employee_id
      dataType: 'json'
      async: false
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "AJAX Error: #{errorThrown}"
      success: (data_array, textStatus, jqXHR) ->
        for datum in data_array
          base_date = datum.implemented_on
          datum_start = base_date + ' ' + datum.time_in.substring(11, 16)
          datum_end = base_date + ' ' + datum.time_out.substring(11, 16)
          current_content = 'Present at [ ' + datum.time_in.substring(11, 16) + ' to ' + datum.time_out.substring(11, 16) + ' ]'
          data_set.push({id: datum.id, content: current_content, start: datum_start, end: datum_end})

    $.ajax
      url: 'employee_attendance_report/get_regular_work_period' + '?attendance_date=' + attendance_date + '&employee_id=' + employee_id
      dataType: 'json'
      async: false
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "AJAX Error: #{errorThrown}"
      success: (work_period, textStatus, jqXHR) ->
        datum_start = attendance_date + ' ' + work_period.time_in.substring(11, 16)
        datum_end = attendance_date + ' ' + work_period.time_out.substring(11, 16)
        data_set.push({id: work_period.id + '_first', content: 'Start : ' + work_period.time_in.substring(11, 16), start: datum_start})
        data_set.push({id: work_period.id + '_last', content: 'End : ' + work_period.time_out.substring(11, 16), start: datum_end})

    options = {zoomable: false}

    if data_set.length == 0
    else
      timeline = new vis.Timeline(current_timeline, data_set, options)