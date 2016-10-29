class Enterprise::GeneralManagement::VehiclesController < Enterprise::GeneralManagementController

  ApplicationController.new.setup_resource_controller(Vehicle,
                                                      'fa fa-bus',
                                                      'Vehicles',
                                                      'Transportation Assets')

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
