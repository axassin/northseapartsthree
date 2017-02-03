class EmployeeStatus < ApplicationRecord

  include GenericResourceCommon
  include EmployeeAssociated


  setup_model('fa-fire',
              'state',
              @@routes.enterprise_human_resources_employee_accounts_management_employee_statuses_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeeStatusesController )

  belongs_to :employee

  include Remark

  validates :state, inclusion: {in: ['ACTIVE','INACTIVE','']}, presence: true

  searchable_string(:owner)
  searchable_string(:state)
  searchable_date(:implemented_at)

end
