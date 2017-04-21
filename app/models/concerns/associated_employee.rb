module AssociatedEmployee extend ActiveSupport::Concern

  included do
    belongs_to :employee

    validates :employee_id, presence: true

    searchable do
      text :employee do
        employee.system_account.name
      end
      string :employee do
        employee.system_account.name
      end
    end

    def employee_name
      Employee.find_by_id(employee_id).system_account.name
    end

  end


end