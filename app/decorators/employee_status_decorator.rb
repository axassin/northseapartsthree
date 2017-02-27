class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator
  include AssociatedEmployeeDecorator

end
