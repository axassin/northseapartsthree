class HolidayDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator

end
