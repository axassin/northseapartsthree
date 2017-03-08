class Enterprise::Operations::GrecoWarehouseController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_greco_warehouse_path,
                     @@routes.enterprise_operations_path)

    @button_set = [[enterprise_operations_greco_warehouse_greco_items_path,'GRECO ITEMS'],
                   [enterprise_operations_greco_warehouse_greco_transactions_path,'GRECO TRANSACTIONS'],
                   [enterprise_operations_greco_warehouse_greco_current_stock_report_path,'GRECO CURRENT STOCK REPORT'],
                   [enterprise_operations_greco_warehouse_greco_out_of_stock_report_path,'GRECO OUT OF STOCK REPORT'],
                   [enterprise_operations_greco_warehouse_greco_transaction_history_path,'GRECO TRANSACTION HISTORY']]

  end

  def index

  end

  def greco_current_stock_report
    @greco_items = GrecoItem.all.order('name ASC')
  end

  def greco_out_of_stock_report
    @greco_items = GrecoItem.all.order('name ASC')
  end

  def greco_transaction_history
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

    @greco_transactions = GrecoTransaction.where(:implemented_on => @start_attendance..@end_attendance).order('implemented_on ASC')

  end

end
