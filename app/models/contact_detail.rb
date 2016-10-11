class ContactDetail < ApplicationRecord

  belongs_to :system_account
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  validates :system_account, presence: true
  validates :label, length: { in: 2..64 }

end
