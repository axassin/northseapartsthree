class ContactDetail < ApplicationRecord

  belongs_to :system_account
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  validates :label, length: { in: 2..64 }
  validates_presence_of :system_account

end
