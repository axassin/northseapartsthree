class Enterprise::Operations::StorageManagement::StorageGeneratorController  < GenericReportController
  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_storage_generator_path,
                     @@routes.enterprise_operations_storage_management_path, 'Storage Generator')

    @storage_unit_id = params[:code] || StorageUnit.order("RAND()").first.id
    @storage_unit = StorageUnit.find_by_id(@storage_unit_id)
    @start_breadth = params[:start_breadth] || @storage_unit.root.depth 
    @end_breadth=  params[:end_breadth] || @storage_unit.depth
  end

   def index

   end
end
