class RegularWorkPeriodDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator
  include TimePrecedenceDecorator

end
