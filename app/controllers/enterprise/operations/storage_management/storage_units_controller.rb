class Enterprise::Operations::StorageManagement::StorageUnitsController < GenericResourceController

  def setup_controller
    setup_variables( StorageUnit,
                     'Storage Unit',
                     'Storage Container',
                     ['ancestry'],
                     ['parent_code'],
                     @@routes.enterprise_operations_storage_management_storage_units_path)
  end


  def process_form(my_storage_unit, current_params, wizard_mode = nil)

    my_storage_unit_processing = Proc.new do   
    my_storage_unit.parent_id = current_params[:parent_id] 
    my_storage_unit.remark = current_params[:remark]
    my_storage_unit.code = current_params[:code]
    my_storage_unit.save!
    end

    setup_process(my_storage_unit, my_storage_unit_processing, wizard_mode)
  end

end

