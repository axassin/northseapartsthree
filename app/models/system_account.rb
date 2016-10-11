class SystemAccount < ApplicationRecord

  has_many :contact_details
  has_many :telephone_numbers, through: :contact_details
  has_many :locations, through: :contact_details
  has_many :links, through: :contact_details

  validates :name, presence: true, length: { in: 2..64 }
  validates :account_type, presence: true, inclusion: { in: %w( INDIVIDUAL BUSINESS ) }
  validates :description, length: { in: 2..512 }

end
