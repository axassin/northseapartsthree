class EmployeeStatus < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-fire',
              'state',
              @@routes.enterprise_human_resources_employee_accounts_management_employee_statuses_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeeStatusesController )

  belongs_to :employee

  validates :employee_id, presence: true
  validates :state, inclusion: {in: ['ACTIVE','INACTIVE','']}, presence: true

end
