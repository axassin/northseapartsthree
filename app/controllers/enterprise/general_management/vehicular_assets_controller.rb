class Enterprise::GeneralManagement::VehicularAssetsController < ApplicationController

  def index
    @resource_subheading = 'Transportation Assets'
    @resource_heading = false
    @resource_search_interface = false
  end

end
