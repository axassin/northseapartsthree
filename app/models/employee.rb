class Employee < ApplicationRecord

  include GenericResourceCommon

  setup_model('black-tie',
              'system_account.name',
              @@routes.enterprise_human_resources_employees_path,
              Enterprise::HumanResources::EmployeesController)

  belongs_to :system_account
  validates_presence_of :system_account

  def account_name
    SystemAccount.find_by_id(system_account_id).name
  end

end
