class Enterprise::Operations::GrecoWarehouse::SafetyStocksController < GenericResourceController

  def setup_controller
    setup_variables( SafetyStock,
                     'Safety Stock',
                     'Maintaining Amount',
                     [],
                     [],
                     @@routes.enterprise_operations_greco_warehouse_safety_stocks_path)
  end

  def process_form(my_safety_stock, current_params, wizard_mode = nil)

    safety_stock_processing = Proc.new do
      my_safety_stock.greco_item_id = current_params[:greco_item_id]
      my_safety_stock.amount = current_params[:amount]
      my_safety_stock.save!
    end

    setup_process(my_safety_stock, safety_stock_processing, wizard_mode)
  end

end
