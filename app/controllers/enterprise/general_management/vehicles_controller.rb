class Enterprise::GeneralManagement::VehiclesController < ApplicationController

  layout 'generic_resource'

  def index
    @resource_glyphicon = 'fa fa-bus'
    @resource_subheading = 'Transportation Assets'
    @vehicles = Vehicle.all
  end

end
