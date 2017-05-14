class Enterprise::Operations::StorageManagement::StorageGeneratorController  < GenericReportController
  def setup_controller
    setup_variables( @@routes.enterprise_operations_storage_management_storage_generator_path,
                     @@routes.enterprise_operations_storage_management_path, 'Storage Generator')
  
    @button_set = [[enterprise_operations_storage_management_storage_generator_create_path,'GENERATE STORAGE']]
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
      puts '----------------TEST ------------------------ '
      puts '---------------------Start------------------------------ '
      puts 'i' + i.to_s
      puts 'params[:code]' + params[:code].to_s
      puts 'params[:start_breadth]' + params[:start_breadth].to_s
      puts 'params[:end_breadth]' + params[:end_breadth].to_s
      puts 'params[:parent_code]' + params[:parent_code].to_s
      puts 'params[:complete_code]' + params[:complete_code].to_s
      puts '@storage_unit_id' + @storage_unit_id.to_s
      puts '@storage_unit ' + @storage_unit.to_s
      puts '@start_breadth' + @start_breadth.to_s
      puts '@end_breadth' + @end_breadth.to_s
      puts '@storage_unit.code ' + @storage_unit.code.to_s 
      puts '@storage_unit.complete_code ' + @storage_unit.complete_code.to_s 
      puts '@storage_unit.parent_code ' + @storage_unit.parent_code.to_s  
      puts '@storage_unit.id ' + @storage_unit.id.to_s  
      puts  '--------------------End TEST ------------------------------- '
      StorageUnit.create!(code: i, remark: 'none', parent_id: @storage_unit.id)
    end

    redirect_to action: 'index',
                  code: params[:code],
                  start_breadth: params[:start_breadth],
                  end_breadth: params[:end_breadth]
  end
end
