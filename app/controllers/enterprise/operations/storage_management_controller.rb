class Enterprise::Operations::StorageManagementController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_path,
                     @@routes.enterprise_operations_path, 'Storage Structure')

    @button_set = [[enterprise_operations_storage_management_storage_units_path,'STORAGE UNITS']]

  end

  def index
    @sample = StorageUnit.order("RAND()").first.complete_code
  end

end


