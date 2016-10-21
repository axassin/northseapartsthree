class VehicleDecorator < MasterDecorator

  include DescriptionDecorator

  def date_of_registration
    object.date_of_registration.strftime('%m/%d/%y')
  end

end
