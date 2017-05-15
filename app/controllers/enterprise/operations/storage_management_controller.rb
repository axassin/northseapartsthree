class Enterprise::Operations::StorageManagementController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_path,
                     @@routes.enterprise_operations_path, 'Storage Structure')
    
    @button_set = [[enterprise_operations_storage_management_storage_units_path,'STORAGE UNITS'],
    [enterprise_operations_storage_management_storage_generator_path,'STORAGE GENERATOR'],
    [enterprise_operations_storage_management_storage_structure_report_path,'STORAGE STRUCTURE REPORT']]

  end

  def index
    @root_storage_nodes = StorageUnit.roots
  end

end


