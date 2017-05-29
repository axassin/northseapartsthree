# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  expense_category_id = $('#expense_category_id').val()
  start_date = $('#start_date').val()
  end_date = $('#end_date').val()
  interval = $('#interval').val()
  url = 'specific_expense_report/get_graph_data?expense_category_id=' + expense_category_id + '&start_date=' + start_date + '&end_date=' + end_date + '&interval=' + interval
  $.ajax url,
    type: 'GET'
    async: false
    dataType: 'text'
    error: (jqXHR, textStatus, errorThrown) ->
      alert errorThrown
      event.preventDefault()
      $('div#error_message').html(' Error has Occurred ')
    success: (data, textStatus, jqXHR) ->

      alert data

      # Process Data
      # original_points = []
      # for key, value of data
        # alert value
        # point = {x: key, y: value}
        # original_points.push(point)

      # Initialize Chart
      ctx = $('#specific_expense_chart')[0]
      ctx.height = 400

      newDateString = (days) ->
        moment().add(days, 'd').format()

      randomScalingFactor = () ->
        Math.round(Math.random() * 100 * (Math.random() > 0.5 ? -1 : 1))

      alert newDateString(0)
      alert randomScalingFactor()

      myChart = new Chart(ctx, {
        type: 'line',
        data: {
          datasets: [{
            label: 'Original',
            lineTension: 0,
            data: [{
              x: newDateString(0),
              y: randomScalingFactor()
            }, {
              x: newDateString(2),
              y: randomScalingFactor()
            }, {
              x: newDateString(4),
              y: randomScalingFactor()
            }, {
              x: newDateString(5),
              y: randomScalingFactor()
            }],
            fill: false
          }]
        },
        options: {
          scales: {
            xAxes: [{
              type: "time",
              time: {
                unit: 'day',
                round: 'day',
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