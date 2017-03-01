class GrecoTransaction < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'summary',
              @@routes.enterprise_operations_greco_warehouse_greco_transactions_path,
              Enterprise::Operations::GrecoWarehouse::GrecoTransactionsController)

  include Remark

  belongs_to :greco_item

  validates :transaction_type, presence: true
  validates_presence_of :greco_item
  validates_numericality_of :quantity

  searchable_string(:remark)
  searchable_string(:transaction_code)
  searchable_string(:transaction_type)
  searchable_string(:item_involved)

  def item_involved
    GrecoItem.find_by_id(greco_item_id).name
  end
 
end
