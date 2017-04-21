class Enterprise::Operations::GrecoWarehouseController < GenericReportController

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
    @title_heading = 'CURRENT STOCK'
    @greco_items = GrecoItem.order('lower(name) ASC').all
  end

  def greco_out_of_stock_report
    @title_heading = 'OUT OF STOCK'
    @greco_items = GrecoItem.order('lower(name) ASC').all.select { |m| m.get_current_stock <= 0 }
  end

  def greco_transaction_history
    @title_heading = 'TRANSACTION HISTORY'
    @start_date = params[:start_date] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')
    @greco_item_id = params[:greco_item_id] || GrecoItem.order("RAND()").first
    @greco_transactions = GrecoTransaction.where(:implemented_on => @start_date..@end_date, :greco_item_id => @greco_item_id).order('implemented_on ASC')

  end

end