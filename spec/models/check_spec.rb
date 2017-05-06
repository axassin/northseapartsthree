require 'rails_helper'

RSpec.describe Check, type: :model do

  describe Check do
    # model variables
    it {
      is_expected.to validate_presence_of(:signatory)
      is_expected.to validate_presence_of(:payee)
      is_expected.to validate_presence_of(:bank_account)
      is_expected.to validate_presence_of(:check_number)
    }
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

  describe 'run number formatting tests' do
    # validate bank-related digit formats
    # activerecord length is 36 as valid
    it {
      should     allow_value("123456789").for(:check_number)
    }
  end





end