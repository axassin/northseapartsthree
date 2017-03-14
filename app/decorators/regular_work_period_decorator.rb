class RegularWorkPeriodDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator
  include AssociatedEmployeeDecorator
  include TimePrecedenceDecorator

end
