class Enterprise::GeneralManagement::ContactDetail < ApplicationRecord

  include GenericResourceCommon

  belongs_to :system_account
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  def labeled_account
    Enterprise::SystemAccount.find_by_id(system_account_id).name.to_s + ' | ' + label.to_s
  end

  validates :label, length: { in: 2..64 }
  validates_presence_of :system_account

  def associated_telephone_numbers
    Enterprise::GeneralManagement::ContactDetails::TelephoneNumber.where(contact_detail_id: id)
  end

  def associated_links
    Enterprise::GeneralManagement::ContactDetails::Link.where(contact_detail_id: id)
  end

  def associated_locations
    Enterprise::GeneralManagement::ContactDetails::Location.where(contact_detail_id: id)
  end

end
