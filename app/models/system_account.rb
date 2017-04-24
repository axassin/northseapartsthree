class SystemAccount < ApplicationRecord

  include GenericResourceCommon
  setup_model('user',
              'name',
              @@routes.enterprise_general_management_system_accounts_path,
              Enterprise::GeneralManagement::SystemAccountsController)

  include ContactableResource
  include Description
  include Name

  mount_uploader :primary_image, PrimaryImageUploader

  has_many :contact_details, as: :contactable, :dependent => :destroy
  has_many :telephone_numbers, through: :contact_details, :dependent => :destroy
  has_many :locations, through: :contact_details, :dependent => :destroy
  has_many :links, through: :contact_details, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  has_one :employee, :dependent => :destroy
  has_one :bank, :dependent => :destroy
  has_one :user, :dependent => :destroy

  validates :account_type, presence: true, inclusion: { in: %w( INDIVIDUAL GROUP ) }
  searchable_string(:account_type)

end
