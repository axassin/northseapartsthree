class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator

end
