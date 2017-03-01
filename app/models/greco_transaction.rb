class GrecoTransaction < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'summary',
              @@routes.enterprise_operations_greco_warehouse_greco_transactions_path,
              Enterprise::Operations::GrecoWarehouse::GrecoTransactionsController)

  include Remark

  belongs_to :greco_item

  searchable_string(:remark)
  searchable_string(:transaction_number)
  searchable_string(:transaction_type)
  searchable_string(:item_involved)

  def item_involved
    GrecoItem.find_by_id(greco_item_id).name
  end

end
