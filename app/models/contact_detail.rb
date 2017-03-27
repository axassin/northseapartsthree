class ContactDetail < ApplicationRecord

  include GenericResourceCommon
  setup_model('book',
              'label',
              @@routes.enterprise_general_management_contact_details_path,
              Enterprise::GeneralManagement::ContactDetailsController )

  belongs_to :contactable, polymorphic: true
  has_many :telephone_numbers, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  has_many :links, :dependent => :destroy

  validates :label, length: { in: 2..64 }
  validates_presence_of :contactable_id
  validates :contactable_type, presence: true, inclusion: { in: %w(SystemAccount Branch)}

  searchable_string(:label)
  searchable_string(:contactable_representative)

  def selector_option_label
    contactable_type.constantize.find_by_id(contactable_id).represent + ' | ' + label
  end

  def contactable_representative
    self.contactable_type.constantize.find_by_id(contactable_id).represent
  end

  def contactable_link
    self.contactable_type.constantize.class_variable_get(:@@resource_path) + '/' + contactable_id
  end

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
