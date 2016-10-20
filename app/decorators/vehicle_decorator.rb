class VehicleDecorator < MasterDecorator

  include Decorators::Description

  def date_of_registration
    object.date_of_registration.strftime('%m/%d/%y')
  end

end
