class Enterprise::GeneralManagement::VehiclesController < ApplicationController

  layout 'generic_resource'

  def index
    setup_table(Vehicle,
                'fa fa-bus',
                nil,
                'Transportation Assets',
                ['primary_image'],
                params[:page],
                params[:items_per_page] )
  end

end
