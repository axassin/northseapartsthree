class Enterprise::GeneralManagement::VehiclesController < Enterprise::GeneralManagementController



  ApplicationController.new.setup_resource_controller(Vehicle,
                                                      'fa fa-bus',
                                                      'Vehicles',
                                                      'Transportation Assets', @@routes.enterprise_general_management_vehicles_path)

  def index
    setup_table(['primary_image'])
  end

  def search_suggestions
    setup_search_suggestions
  end

  def new
    setup_form
  end

  def create
    puts '------------ sherwin -------------'
    puts params[controller_name.to_s.singularize.downcase][:plate_number]
    redirect_to action: 'index'
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
