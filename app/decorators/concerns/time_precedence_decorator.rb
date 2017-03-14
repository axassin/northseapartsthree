module TimePrecedenceDecorator
  extend ActiveSupport::Concern

  def time_in
    object.time_in.strftime("%r")
  end

  def time_out
    object.time_out.strftime("%r")
  end

end