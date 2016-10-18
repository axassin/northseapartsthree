class Vehicle < ApplicationRecord

  validates :color, length: { in: 2..64 }, presence: true
  validates :make, length: { in: 2..64 }, presence: true
  validates :brand, length: { in: 2..64 }, presence: true
  validates :fuel_type, length: { in: 2..64 }, presence: true
  validates :plate_number, length: { in: 2..64 }, presence: true
  validates :date_of_registration, presence: true

end
