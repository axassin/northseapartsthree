class GrecoItem < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'summary',
              @@routes.enterprise_operations_greco_warehouse_greco_items_path,
              Enterprise::Operations::GrecoWarehouse::GrecoItemsController)

  include Description

  has_many :greco_transactions, :dependent => :destroy

  validates :name, presence: true, length: { in: 2..64 }
  validates :description, length: { in: 2..512 }

  searchable_string(:name)
  searchable_string(:description)

  def summary
    name.to_s + ' | ' + description.to_s
  end

end
