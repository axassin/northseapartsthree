class RestDayDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator
  include AssociatedEmployeeDecorator

end
