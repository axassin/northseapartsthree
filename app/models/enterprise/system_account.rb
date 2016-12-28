class Enterprise::SystemAccount < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-user')

  include Description

  mount_uploader :primary_image, PrimaryImageUploader

  has_many :contact_details
  has_many :telephone_numbers, through: :contact_details
  has_many :locations, through: :contact_details
  has_many :links, through: :contact_details

  validates :name, presence: true, length: { in: 2..64 }
  validates :account_type, presence: true, inclusion: { in: %w( INDIVIDUAL BUSINESS ) }
  validates :description, length: { in: 2..512 }

  def has_contact_detail?
    ContactDetail.exists?(system_account_id: self.id)
  end

end
