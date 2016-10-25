class Enterprise::GeneralManagement::VehiclesController < Enterprise::GeneralManagementController

  layout 'generic_resource'

  def index
    setup_table(Vehicle,
                'fa fa-bus',
                nil,
                'Transportation Assets',
                ['primary_image'],
                params[:page],
                params[:per_page],
                params[:search_query] )
  end

end
