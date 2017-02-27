class BiodatumDecorator < ApplicationDecorator
  delegate_all

  include AssociatedEmployeeDecorator

  def date_of_birth
    object.created_at.strftime("%m/%d/%Y")
  end

end