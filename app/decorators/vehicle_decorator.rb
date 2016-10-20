class VehicleDecorator < MasterDecorator

  def color

  end

  def date_of_registration
    object.created_at.strftime("%m/%d/%y")
  end

end
