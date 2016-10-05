class SystemAccount < ApplicationRecord

  has_many :contact_details
  has_many :telephone_numbers, through: :contact_details
  has_many :locations, through: :contact_details
  has_many :links, through: :contact_details

end
