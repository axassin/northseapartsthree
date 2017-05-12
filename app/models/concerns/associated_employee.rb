module AssociatedEmployee extend ActiveSupport::Concern

  included do
    belongs_to :employee

    validates :employee_id, presence: true

    searchable do
      text :employee_name
      string :employee_name
    end

    def employee_name
      if Employee.find_by_id(employee_id).present?
        Employee.find_by_id(employee_id).represent
      end
    end

  end


end