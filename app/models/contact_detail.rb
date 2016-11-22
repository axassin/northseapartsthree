class ContactDetail < ApplicationRecord

  include UUIDConcern

  belongs_to :system_account
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  def labeled_account
    SystemAccount.find_by_id(system_account_id).name.to_s + ' | ' + label.to_s
  end

  validates :label, length: { in: 2..64 }
  validates_presence_of :system_account

end
