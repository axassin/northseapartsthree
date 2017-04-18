class Enterprise::Operations::StorageManagementController < ApplicationController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_path,
                     @@routes.enterprise_operations_path)

    @button_set = [[enterprise_operations_storage_management_storage_units_path,'STORAGE UNITS']]

  end

  def index

  end

end


