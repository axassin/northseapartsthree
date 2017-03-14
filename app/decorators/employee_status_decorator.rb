class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator
  include AssociatedEmployeeDecorator

end
