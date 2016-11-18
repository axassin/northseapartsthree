class TelephoneNumber < ApplicationRecord

  include UUIDConcern
  include Remark
  include Timestamps

  belongs_to :contact_detail

  validates_presence_of :contact_detail
  validates :digits, length: { in: 5..64 }, presence: true, uniqueness: true

  searchable_string(:digits)

  def label
    ContactDetail.find_by_id(contact_detail_id).label
  end

  def owner
    owner_account = ContactDetail.find_by_id(contact_detail_id).system_account
    SystemAccount.find_by_id(owner_account.id).name
  end

  searchable do
    text :label
    string :label

    text :owner
    string :owner
  end

end
