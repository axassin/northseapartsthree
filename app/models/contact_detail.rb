class ContactDetail < ApplicationRecord

  belongs_to :system_account
  has_many :telephone_numbers
  has_many :locations
  has_many :links

end
