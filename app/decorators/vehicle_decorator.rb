class VehicleDecorator < ApplicationDecorator

  delegate_all

  include DescriptionDecorator

  def date_of_registration
    object.date_of_registration.strftime('%m/%d/%Y')
  end

end
