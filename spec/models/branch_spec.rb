require 'rails_helper'

RSpec.describe Branch, type: :model do

  describe Branch do
    # dependency injection
    it {
      is_expected.to_not validate_inclusion_of(GenericResourceCommon)
      is_expected.to_not validate_inclusion_of(ContactableResource)
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
      should have_many(:contact_details)
      should have_many(:employees)
    end
  end

end
