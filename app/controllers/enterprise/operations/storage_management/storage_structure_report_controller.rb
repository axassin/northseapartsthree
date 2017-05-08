class Enterprise::Operations::StorageManagement::StorageStructureReportController  < GenericReportController


  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_storage_structure_report_path,
                     @@routes.enterprise_operations_storage_management_path, 'Storage Structure Report')
  end

   def index

  end
end
