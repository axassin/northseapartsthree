class Location < ApplicationRecord

  belongs_to :contact_detail

  validates :longitude, length: {minimum: 5, maximum: 256}, presence: true
  validates :latitude, length: {minimum: 5, maximum: 256}, presence: true
  validates :address, length: {minimum: 5, maximum: 256}, presence: true
  validates :contact_detail_id, presence: true

end
