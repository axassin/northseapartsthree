require 'rails_helper'

RSpec.describe Cash, type: :model do

    describe Cash do
      # dependency injection
      it {
        is_expected.to_not validate_inclusion_of(GenericResourceCommon)
        is_expected.to_not validate_inclusion_of(ExchangeableMedium)
      }
    end

    describe 'run model validity checking' do
      it {
        subject.valid?
      }
    end

end