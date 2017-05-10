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
    sample_chain = ''
    delimiter=':'
    StorageUnit.where(code: code).each do |storage_unit|
      storage_unit.ancestors.each do |ancestor|
        unless sample_chain.present?
          sample_chain = ancestor.code.to_s  
        else
          sample_chain = sample_chain + delimiter + ancestor.code.to_s  
        end 
      end
    end
    sample_chain
  end

  def parent_code
    parent.represent if parent.present?
  end
 
  def descendant_code     
    sample_chain = ''
    delimiter=':'
    StorageUnit.where(code: code).each do |storage_unit|
      storage_unit.descendants.each do |descendant|
        unless sample_chain.present?
          sample_chain = descendant.code.to_s  
        else
          sample_chain = sample_chain + delimiter + descendant.code.to_s  
        end 
      end
    end
    sample_chain
  end

  def last_breadth
    if child_ids.empty?
      return depth
    else
      return children.map{|c| c.last_breadth}.max
    end
  end
end
