class SystemAccount < ApplicationRecord

  include GenericResourceCommon
  include ContactableResource

  setup_model('fa-user',
              'name',
              @@routes.enterprise_system_accounts_path,
              Enterprise::SystemAccountsController)

  include Description

  mount_uploader :primary_image, PrimaryImageUploader

  has_many :contact_details, as: :contactable
  has_many :telephone_numbers, through: :contact_details
  has_many :locations, through: :contact_details
  has_many :links, through: :contact_details

  validates :name, presence: true, length: { in: 2..64 }
  validates :account_type, presence: true, inclusion: { in: %w( INDIVIDUAL BUSINESS ) }
  validates :description, length: { in: 2..512 }

end
