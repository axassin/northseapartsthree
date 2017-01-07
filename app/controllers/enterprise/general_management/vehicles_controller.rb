class Enterprise::GeneralManagement::VehiclesController < GenericResourceController

  def setup_controller
    setup_variables( Vehicle,
                     'Vehicles',
                     'Transportation Assets',
                     ['primary_image'],
                     [],
                     @@routes.enterprise_general_management_path)
  end

  def process_form(my_vehicle, current_params, wizard_mode = nil)

    vehicle_processing = Proc.new do
      my_vehicle.color = current_params[:color]
      my_vehicle.make = current_params[:make]
      my_vehicle.brand = current_params[:brand]
      my_vehicle.plate_number = current_params[:plate_number]
      my_vehicle.fuel_type = current_params[:fuel_type]
      my_vehicle.description = current_params[:description]
      my_vehicle.date_of_registration = current_params[:date_of_registration]
      update_primary_image(my_vehicle, current_params)
      my_vehicle.save!
      return my_vehicle.id
    end

    setup_process(vehicle_processing, wizard_mode)
  end

end
