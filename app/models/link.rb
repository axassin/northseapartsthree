class Link < ApplicationRecord

  belongs_to :contact_detail

  validates :url, length: {minimum: 5, maximum: 256}, presence: true
  validates :contact_detail_id, presence: true

end
