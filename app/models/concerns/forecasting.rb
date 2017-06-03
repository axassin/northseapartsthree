# ------------------------------------
# Add module to models which require forecasting functionality with line graphs.
# Be sure to set the 'setup_current_value_forecast' method in original method;
# this must result in a total value within expected range
# ------------------------------------

module Forecasting extend ActiveSupport::Concern

  included do

    # called by controller class
    def graph_data(start_date, end_date, interval)

      start_date = Date.parse(start_date)
      end_date = Date.parse(end_date)
      line_chart_array = Array.new
      original = Hash.new
      original_data = Hash.new
      current_date = start_date

      while current_date <= end_date
        start_range = current_date
        end_range = start_range + 1.send(interval)
        current_value = setup_current_value_forecast(start_range, end_range)
        if current_date > Date.today
          original_data[current_date] = nil
        else
          original_data[current_date] = current_value
        end
        current_date = current_date + 1.send(interval)
      end

      # Put Original in Result Array
      original[:name] = 'Original'
      original[:data] = original_data
      line_chart_array.push(original)

      # Put Results of Three Point Moving Average in Result Array
      three_point_moving_average = Hash.new
      three_point_moving_average_data = three_point_moving_average(original_data,interval)
      percent_accuracy = ((1-smape(original_data, three_point_moving_average_data, interval))*100).round(2)
      three_point_moving_average[:name] = 'Three Point Moving Average ' + percent_accuracy.to_s + '%'
      three_point_moving_average[:data] = three_point_moving_average_data
      line_chart_array.push(three_point_moving_average)

      # Result Array
      line_chart_array
    end

    # Sample 3 Point Moving Average
    private
    def three_point_moving_average(original,interval)
      forecast = Hash.new
      index = 0
      divisor = 3

      if original.size > 3
        while index < (original.size + 1)
          main_key = original.keys[index]
          first_dividend = original.values[index-1]
          second_dividend = original.values[index-2]
          third_dividend = original.values[index-3]
          if (index >= 3) && first_dividend.present? && second_dividend.present? && third_dividend.present?
            if main_key == nil
              main_key = original.keys[index-1] + 1.send(interval)
            end
            forecast[main_key] = ((first_dividend + second_dividend + third_dividend)/divisor).round(2)
          end
          index += 1
        end
      end
      forecast
    end

    # Determines Forecasting Accuracy . Higher the Value, the larger the error.
    private
    def smape(original, forecast, interval)
      index = 0
      min_date = [original.keys.min, forecast.keys.min].min
      max_date = [original.keys.max, forecast.keys.max].max
      current_date = min_date
      summation = 0
      while current_date < max_date
        actual_value = original[current_date]
        forecast_value = forecast[current_date]
        if actual_value.present? && forecast_value.present?
          summation += ((forecast_value - actual_value).abs/(actual_value.abs + forecast_value.abs))
          index += 1
        end
        current_date += 1.send(interval)
      end
      ((summation)/index.to_f).round(2)
    end

  end
end