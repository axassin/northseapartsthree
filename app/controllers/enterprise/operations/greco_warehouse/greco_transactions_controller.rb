class Enterprise::Operations::GrecoWarehouse::GrecoTransactionsController < GenericResourceController

  def setup_controller
    setup_variables( GrecoTransaction,
                     'Greco Transaction',
                     'Temporary Greco Inventory',
                     ['greco_item_id'],
                     ['item_involved'],
                     @@routes.enterprise_operations_greco_warehouse_greco_transactions_path)
  end

  def process_form(my_greco_transaction, current_params, wizard_mode = nil)

    greco_transactions_processing = Proc.new do
      my_greco_transaction.greco_item = GrecoItem.find(current_params[:greco_item_id])
      my_greco_transaction.quantity = current_params[:quantity]
      my_greco_transaction.transaction_code = current_params[:transaction_code]
      my_greco_transaction.transaction_type = current_params[:transaction_type]
      my_greco_transaction.implemented_on = current_params[:implemented_on]
      my_greco_transaction.remark = current_params[:remark]
      my_greco_transaction.save!
    end

    setup_process(my_greco_transaction, greco_transactions_processing, wizard_mode)
  end


end
