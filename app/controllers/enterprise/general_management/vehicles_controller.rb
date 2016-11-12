class Enterprise::GeneralManagement::VehiclesController < Enterprise::GeneralManagementController

  ApplicationController.new.setup_resource_controller(Vehicle,
                                                      'fa fa-bus',
                                                      'Vehicles',
                                                      'Transportation Assets', @@routes.enterprise_general_management_vehicles_path)

  def index
    setup_index(['primary_image'], @@routes.enterprise_general_management_path)
  end

  def search_suggestions
    setup_search_suggestions
  end

  def process_form(my_vehicle, current_params)

    vehicle_processing = Proc.new do
      my_vehicle.color = current_params[:color]
      my_vehicle.make = current_params[:make]
      my_vehicle.brand = current_params[:brand]
      my_vehicle.plate_number = current_params[:plate_number]
      my_vehicle.fuel_type = current_params[:fuel_type]
      my_vehicle.description = current_params[:description]
      my_vehicle.date_of_registration = current_params[:date_of_registration]
      unless action_name == 'update' && current_params[:primary_image].blank? == true
        my_vehicle.primary_image = current_params[:primary_image]
      end
      my_vehicle.save!
    end

    setup_process(vehicle_processing)
  end

  def new
    setup_form
  end

  def create
    process_form(Vehicle.new, params[:vehicle])
  end

  def show
    setup_form
  end

  def edit
    puts ' --------------- HUeh huehhhhhhhhh 000 -------------------------------'
    setup_form
  end

  def update
    process_form(Vehicle.find(params[:id]), params[:vehicle])
  end

  def destroy
    puts 'sample'
  end

end
