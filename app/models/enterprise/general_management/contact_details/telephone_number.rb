class Enterprise::GeneralManagement::ContactDetails::TelephoneNumber < ApplicationRecord

  include GenericResourceCommon
  include Contactable
  include Remark

  belongs_to :contact_detail

  validates_presence_of :contact_detail
  validates :digits, length: { in: 5..64 }, presence: true, uniqueness: true

  searchable_string(:digits)

end
