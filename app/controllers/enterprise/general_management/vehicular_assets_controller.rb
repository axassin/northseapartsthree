class Enterprise::GeneralManagement::VehicularAssetsController < ApplicationController

  layout 'generic_resource'

  def index
    @resource_glyphicon = 'fa fa-truck'
    @resource_subheading = 'Transportation Assets'
    @vehicles = Vehicle.all
  end

end
