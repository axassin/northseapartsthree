class Link < ApplicationRecord

  belongs_to :contact_detail

  validates :service, length: { in: 2..64 }, presence: true
  validates :url, length: { in: 2..512 }, presence: true
  validates :contact_detail, presence: true

end
