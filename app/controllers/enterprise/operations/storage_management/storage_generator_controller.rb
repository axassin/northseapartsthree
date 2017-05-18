class Enterprise::Operations::StorageManagement::StorageGeneratorController  < GenericGeneratorController
  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_storage_generator_path,
                     @@routes.enterprise_operations_storage_management_path, 'Storage Generator')
  end

  def index 
    @storage_unit_id = params[:code] || StorageUnit.order("RAND()").first.id
    @storage_unit = StorageUnit.find_by_id(@storage_unit_id)
    @start_breadth = params[:start_breadth] || @storage_unit.root.depth 
    @end_breadth=  params[:end_breadth] || @storage_unit.last_breadth
  end

  def create
    @storage_unit_id = params[:code] || StorageUnit.order("RAND()").first.id
    @storage_unit = StorageUnit.find_by_id(@storage_unit_id)
    @start_breadth = params[:start_breadth] || @storage_unit.root.depth 
    @end_breadth=  params[:end_breadth] || @storage_unit.last_breadth
    for i in @start_breadth..@end_breadth
      StorageUnit.create!(code: i, remark: 'none', parent_id: @storage_unit.id)
    end

    redirect_to enterprise_operations_storage_management_storage_units_path
  end
end
