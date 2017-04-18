class StorageUnit < ApplicationRecord

  include GenericResourceCommon
  include Remark

  has_ancestry
  
  setup_model('info-circle',
              'code',
              @@routes.enterprise_operations_storage_management_storage_units_path,
              Enterprise::Operations::StorageManagement::StorageUnitsController)
  
  
  searchable_string(:code)
  searchable_string(:parent_storage)
  
  def parent_representation
    parent.represent
  end
end
