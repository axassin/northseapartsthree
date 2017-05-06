require 'rails_helper'

RSpec.describe ContactDetail, type: :model do

  # validates :label, length: { in: 2..64 }
  # validates_presence_of :contactable_id
  # validates :contactable_type, presence: true, inclusion: { in: %w(SystemAccount Branch)}

  describe ContactDetail do
    # dependency injection
    it {
      is_expected.to_not validate_inclusion_of(GenericResourceCommon)
    }
    # inheritance
    it {
      is_expected.to belong_to(:contactable)
    }
  end

  describe 'run model validity checking' do
    it {
      subject.valid?
    }
  end

  describe 'run model relation checking' do
    # relation
    it do
      should have_many(:telephone_numbers)
      should have_many(:locations)
      should have_many(:links)
    end
  end

end
