class Enterprise::Operations::GrecoWarehouse::GrecoItemsController < GenericResourceController

  def setup_controller
    setup_variables( GrecoItem,
                     'Greco Item',
                     'Temporary Greco Inventory',
                     [],
                     [],
                     @@routes.enterprise_operations_greco_warehouse_greco_items_path)
  end

  def process_form(my_greco_item, current_params, wizard_mode = nil)

    greco_items_processing = Proc.new do
      my_greco_item.name = current_params[:name]
      my_greco_item.remark = current_params[:remark]
      my_greco_item.save!
    end

    setup_process(my_greco_item, greco_items_processing, wizard_mode)
  end


end
