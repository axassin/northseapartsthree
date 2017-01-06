class ContactDetail < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-book')

  belongs_to :contactable, polymorphic: true
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  def labeled_account
    case contactable_type
      when SystemAccount
        SystemAccount.find_by_id(contactable_id).name.to_s + ' | ' + label.to_s
      when Branch
        Branch.find_by_id(contactable_id).name.to_s + ' | ' + label.to_s
      else
        'N/A'
    end
  end

  validates :label, length: { in: 2..64 }

  def associated_telephone_numbers
    TelephoneNumber.where(contact_detail_id: id)
  end

  def associated_links
    Link.where(contact_detail_id: id)
  end

  def associated_locations
    Location.where(contact_detail_id: id)
  end

end
