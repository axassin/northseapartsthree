require 'rails_helper'

RSpec.describe AssociatedImage, type: :model do

  describe AssociatedImage do
    # model variables
    it {
      is_expected.to_not validate_presence_of(:description)
      is_expected.to_not validate_presence_of(:name)
      is_expected.to_not validate_presence_of(:image)
    }
    # dependency injection
    it {
      is_expected.to_not validate_inclusion_of(Description)
    }
    # inheritance
    it {
      is_expected.to belong_to(:imageable)
    }
  end

  describe 'run model validity checking' do
    it {
      subject.valid?
    }
  end

end