module Forecasting
  extend ActiveSupport::Concern

  included do

    private
    def three_point_moving_average(original)
      original_length = original.length
      end_length = original_length + 1
      forecast_array = []
      index = 0
      if original_length > 3
        while index < end_length
          if (index-3) >= 0
            first_dividend = original[index-1]
            second_dividend = original[index-2]
            third_dividend = original[index-3]
            divisor = 3
            value = ((first_dividend + second_dividend + third_dividend)/divisor).round(2)
            forecast_array.push(value)
          else
            forecast_array.push(nil)
          end
          index = index + 1
        end
      end
      forecast_array
    end

    private
    def point_average(original)
      original_length = original.length
      total = 0
      average = 0
      original.last(original_length).each do |element|
        total = total + element
        average = (total/original_length)
      end
    end

    private
    def mape(original, prediction)
      original_length = original.length
      index = 0
      total = 0
      while index < original_length
        if original[index].present?
          total = total + (original[index] - prediction[index]).abs
        end
      end
      total
    end

  end

end