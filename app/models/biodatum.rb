class Biodatum < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-id-badge',
              'description',
              @@routes.enterprise_human_resources_employee_accounts_management_biodata_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::BiodataController )

  belongs_to :system_account

  validates :system_account_id, presence: true
  validates :name_of_mother, length: { in: 2..256 }
  validates :name_of_father, length: { in: 2..256 }
  validates :dependents, length: { in: 2..256 }
  validates :complexion, length: { in: 2..64 }
  validates :height, length: { in: 2..64 }
  validates :sex, length: { in: 2..64 }, inclusion: {in: %w(MALE FEMALE)}
  validates :blood_type, length: { in: 1..64 }, inclusion: {in: %w(O A B AB)}
  validates :education, length: { in: 2..256 }
  validates :experience, length: { in: 2..256 }
  validates :notable_accomplishment, length: { in: 2..256 }
  validates :description, length: { in: 2..512 }

end
