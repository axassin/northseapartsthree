class TelephoneNumber < ApplicationRecord

  include GenericResourceCommon
  setup_model('phone',
              'digits',
              @@routes.enterprise_general_management_contact_details_telephone_numbers_path,
              Enterprise::GeneralManagement::ContactDetails::TelephoneNumbersController)

  include ContactArticulation
  include Remark

  belongs_to :contact_detail

  validates_presence_of :contact_detail
  validates :digits, length: { in: 5..64 }, presence: true, uniqueness: true

  searchable_string(:digits)



end
