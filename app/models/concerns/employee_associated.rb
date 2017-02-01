module EmployeeAssociated
  extend ActiveSupport::Concern

  included do

    validates :employee_id, presence: true

    searchable do
      text :owner
      string :owner
    end

    def owner
      Employee.find(employee_id).system_account.name
    end

  end



end