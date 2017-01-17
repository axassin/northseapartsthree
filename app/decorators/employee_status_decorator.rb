class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  def implemented_at
    object.implemented_at.strftime("%m/%d/%Y")
  end

end
