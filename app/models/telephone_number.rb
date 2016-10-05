class TelephoneNumber < ApplicationRecord

  belongs_to :contact_detail

  validates :digits, length: {minimum: 5, maximum: 256}, presence: true

end
