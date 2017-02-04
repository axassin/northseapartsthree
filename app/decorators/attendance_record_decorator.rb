class AttendanceRecordDecorator < ApplicationDecorator
  delegate_all

  def time_in
    object.time_in.strftime("%r")
  end

  def time_out
    object.time_out.strftime("%r")
  end

  def date_of_attendance
    object.date_of_attendance.strftime("%m/%d/%Y")
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
