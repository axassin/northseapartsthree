class Employee < ApplicationRecord

  include GenericResourceCommon

  setup_model('fa-black-tie',
              'designation',
              @@routes.enterprise_human_resources_employee_accounts_management_employees_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeesController)

  belongs_to :system_account
  has_one :biodatum
  has_many :employee_statuses
  has_many :associated_files, as: :fileable
  has_many :associated_images, as: :imageable
  has_many :employee_statuses
  belongs_to :branch

  validates_presence_of :branch
  validates_presence_of :system_account
  validates :branch, length: { in: 0..64 }, :allow_nil => true

  scope :active_branches, -> (branch_id, status) { where(['branch_id = ?', branch_id]).select { |employee| employee.current_state == status }}

  def designation
    SystemAccount.find_by_id(system_account_id).name + ' (' + position + ') at ' + Branch.find_by_id(branch_id).name
  end

  def account_name
    SystemAccount.find_by_id(system_account_id).name
  end

  def mother_branch
    Branch.find_by_id(branch_id).represent
  end

  def current_state
    employee_status =  EmployeeStatus.where(['implemented_at <= ? AND employee_id = ?', Date.today, id])
    employee_status.order('implemented_at DESC').first.state.to_s if employee_status.present?
  end

  searchable_string(:account_name)
  searchable_string(:mother_branch)
  searchable_string(:position)

end
