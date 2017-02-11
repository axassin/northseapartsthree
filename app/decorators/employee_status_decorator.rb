class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAt
  include AssociatedEmployee

end
