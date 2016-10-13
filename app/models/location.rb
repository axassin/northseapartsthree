class Location < ApplicationRecord

  belongs_to :contact_detail

  validates :longitude, length: { in: 2..256 }, presence: true
  validates :latitude, length: { in: 2..256 }, presence: true
  validates :address, length: { in: 2..256 }, presence: true

end
