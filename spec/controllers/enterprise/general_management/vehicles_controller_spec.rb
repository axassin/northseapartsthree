require 'rails_helper'

RSpec.describe Enterprise::GeneralManagement::VehiclesController, type: :controller do

  it_behaves_like 'generic_resource_controller', 'vehicle'

end
