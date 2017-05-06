require 'rails_helper'

RSpec.describe AssociatedFile, type: :model do

  describe AssociatedFile do
    # model variables
    it {
      is_expected.to_not validate_presence_of(:description)
      is_expected.to_not validate_presence_of(:name)
      is_expected.to_not validate_presence_of(:file)
    }
    # dependency injection
    it {
      is_expected.to_not validate_inclusion_of(Description)
    }
    # inheritance
    it {
      is_expected.to belong_to(:fileable)
    }
  end

  describe 'run model validity checking' do
    it {
      subject.valid?
    }
  end

end