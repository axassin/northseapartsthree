class TelephoneNumber < ApplicationRecord

  belongs_to :contact_detail

  validates :digits, length: { in: 5..64 }, presence: true
  validates :contact_detail, presence: true

end
