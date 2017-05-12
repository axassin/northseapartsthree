class StorageUnit < ApplicationRecord

  include GenericResourceCommon
  include Remark

  has_ancestry
  
  setup_model('info-circle',
              'code',
              @@routes.enterprise_operations_storage_management_storage_units_path,
              Enterprise::Operations::StorageManagement::StorageUnitsController)
  
  
  searchable_string(:code)

  def complete_code
    'dfasdnfaskldjfhdklfh '
    puts '----------------- --- ---'
    puts 'dfasdfas'
  end

  def parent_code
    parent.represent
  end

end
