# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  expense_category_id = $('#expense_category_id').val()
  start_date = $('#start_date').val()
  end_date = $('#end_date').val()
  interval = $('#interval').val()

  url = 'examine_expense/get_graph_data?expense_category_id=' + expense_category_id + '&start_date=' + start_date + '&end_date=' + end_date + '&interval=' + interval

  $.ajax url,
    type: 'GET'
    async: false
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      alert errorThrown
      event.preventDefault()
      $('div#error_message').html(' Error has Occurred ')
    success: (result, textStatus, jqXHR) ->

      start_date = moment(start_date)
      current_date = start_date
      end_date = moment(end_date)

      original_array = []
      three_point_moving_average = []

      index = 0
      while current_date < end_date
        original_value = result.original[index]
        original_array.push({x: current_date.format(), y: original_value})
        three_point_moving_average_value = result.three_point_moving_average[index]
        three_point_moving_average.push({x: current_date.format(), y: three_point_moving_average_value[index]})
        current_date.add(1, interval)
        index++

      # Initialize Chart
      ctx = $('#examine_expense_chart')[0]
      ctx.height = 400

      myChart = new Chart(ctx, {
        type: 'line',
        data: {
          datasets: [
            { label: 'Original', lineTension: 0, data: original_array, fill: false },
            { label: 'Three Point Moving Average', lineTension: 0, data: three_point_moving_average, fill: false }]
        },
        options: {
          scales: {
            xAxes: [{
              type: "time",
              time: {
                unit: interval,
                round: interval,
                displayFormats: {
                  day: 'MMM D'
                }
              }
            }],
            yAxes: [{
              display: true,
              scaleLabel: {
                display: true,
                labelString: 'Amount (PHP)'
              }
            }]
          }
        }
      })