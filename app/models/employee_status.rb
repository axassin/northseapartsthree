class EmployeeStatus < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee

  setup_model('state',
              @@routes.enterprise_human_resources_employee_accounts_management_employee_statuses_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeeStatusesController )

  belongs_to :employee

  include Remark

  validates :state, inclusion: {in: ['ACTIVE','INACTIVE','']}, presence: true

  searchable_string(:state)
  searchable_date(:implemented_on)

end
