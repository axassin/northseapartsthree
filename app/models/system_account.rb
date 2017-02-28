class SystemAccount < ApplicationRecord

  include GenericResourceCommon
  include ContactableResource

  setup_model('user',
              'name',
              @@routes.enterprise_general_management_system_accounts_path,
              Enterprise::GeneralManagement::SystemAccountsController)

  include Description

  mount_uploader :primary_image, PrimaryImageUploader

  has_many :contact_details, as: :contactable, :dependent => :destroy
  has_many :telephone_numbers, through: :contact_details, :dependent => :destroy
  has_many :locations, through: :contact_details, :dependent => :destroy
  has_many :links, through: :contact_details, :dependent => :destroy
  has_one :employee, :dependent => :destroy

  validates :name, presence: true, length: { in: 2..64 }
  validates :account_type, presence: true, inclusion: { in: %w( INDIVIDUAL BUSINESS ) }
  validates :description, length: { in: 2..512 }

  searchable_string(:name)
  searchable_string(:description)
  searchable_string(:account_type)

end
