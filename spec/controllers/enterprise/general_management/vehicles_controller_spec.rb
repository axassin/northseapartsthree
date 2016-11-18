require 'rails_helper'

RSpec.describe Enterprise::GeneralManagement::VehiclesController, type: :controller do

  it_behaves_like 'generic_resource_controller',
                  'vehicle',
                  'fa fa-bus',
                  'Vehicles',
                  'Transportation Assets',
                  Rails.application.routes.url_helpers.enterprise_general_management_vehicles_path,
                  ['primary_image'],
                  Rails.application.routes.url_helpers.enterprise_general_management_path

end
