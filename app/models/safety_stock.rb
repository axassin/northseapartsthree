class SafetyStock < ApplicationRecord

  include GenericResourceCommon
  setup_model('summary',
              @@routes.enterprise_operations_greco_warehouse_safety_stocks_path,
              Enterprise::Operations::GrecoWarehouse::SafetyStocksController)

  belongs_to :greco_item

  validates_uniqueness_of :greco_item

  def summary
    amount + GrecoItem.find_by_id(greco_item_id).name.to_s
  end

end
