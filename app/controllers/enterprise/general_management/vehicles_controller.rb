class Enterprise::GeneralManagement::VehiclesController < ApplicationController

  layout 'generic_resource'

  def index
    setup_table(Vehicle, 'fa fa-bus', nil, 'Transportation Assets')
  end

end
