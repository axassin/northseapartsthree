class Vehicle < ApplicationRecord

  include UUIDConcern
  include Description
  include Timestamps

  mount_uploader :primary_image, PrimaryImageUploader

  validates :color, length: { in: 2..64 }, presence: true
  validates :make, length: { in: 2..64 }, presence: true
  validates :brand, length: { in: 2..64 }, presence: true
  validates :fuel_type, length: { in: 2..64 }, presence: true
  validates :plate_number, length: { in: 2..64 }, presence: true, uniqueness: true
  validates :date_of_registration, presence: true

  searchable_string(:color)
  searchable_string(:make)
  searchable_string(:brand)
  searchable_string(:plate_number)
  searchable_string(:fuel_type)

  searchable do
    time :date_of_registration
    string :date_of_registration
  end

end
