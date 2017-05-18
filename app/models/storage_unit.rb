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
          sample_chain = sample_chain + delimiter + descendant.code.to_s  + descendant.depth.to_s  
        end 
      end
    end
    sample_chain
  end

  def last_breadth
    sample_chain = '0'
    delimiter=':'
    StorageUnit.where(code: code).each do |storage_unit|
      if has_children?
        storage_unit.descendants.each do |descendant|
          if descendant.depth.to_i > sample_chain.to_i
            sample_chain = descendant.depth
          end
        end
      elsif is_childless?    
            sample_chain = storage_unit.depth
          end
    end
    sample_chain

   # if child_ids.empty?
 #    return depth
  #  else
  #    return children.map{|c| c.last_breadth}.max
 #   end
  end

  def siblings_code
    sample_chain = ''
    delimiter = ':'
    StorageUnit.where(code: code).each do |storage_unit|
      if storage_unit.is_only_child? 
          sample_chain="Only child"
      elsif siblings.present?
          storage_unit.siblings.each do |sibling| 
            unless sample_chain.present?
              sample_chain = sibling.represent
            else       
              sample_chain = sample_chain + delimiter + sibling.represent
            end
          end
      end 
    end
    sample_chain
  end

  def child_code
    sample_chain = ''
    delimiter = ':'
    StorageUnit.where(code: code).each do |storage_unit|
          if has_children?
            storage_unit.children.each do |child|                                    
                unless sample_chain.present?
                 sample_chain = child.represent 
                else       
                   sample_chain = sample_chain + delimiter + child.represent 
                end
              end
          elsif is_childless?    
            sample_chain = 'No Child'
          end
        end 
     sample_chain
  end 
 
  def last_child_code
    sample_chain = ''
    StorageUnit.where(code: code).each do |storage_unit|
      storage_unit.descendants.each do |descendant|
        if storage_unit.last_breadth.to_i == descendant.depth.to_i
          sample_chain = sample_chain.to_s + " " + descendant.code.to_s  + " depth: "+ descendant.depth.to_s  
        end
      end
    end
    sample_chain
  end

end
