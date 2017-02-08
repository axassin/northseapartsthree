module AssociatedEmployee
  extend ActiveSupport::Concern

  included do

    belongs_to :employee

    validates :employee_id, presence: true

    searchable do
      text :associated_employee
      string :associated_employee
    end

    def associated_employee
      Employee.find_by_id(employee_id).system_account.name
    end

  end



end