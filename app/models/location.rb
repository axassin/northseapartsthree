class Location < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-map-marker', 'address')

  include ContactArticulation

  belongs_to :contact_detail

  validates_presence_of :contact_detail
  validates :longitude, length: { in: 2..256 }, presence: true
  validates :latitude, length: { in: 2..256 }, presence: true
  validates :address, length: { in: 2..256 }, presence: true

  searchable_string(:address)

end
