class HolidayDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator

end
