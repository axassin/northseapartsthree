require 'rails_helper'

RSpec.describe BankTransfer, type: :model do

  describe BankTransfer do
    # model variables
    it {
      is_expected.to validate_presence_of(:from_bank_account_number_id)
      is_expected.to validate_presence_of(:to_bank_account_number_id)
      is_expected.to validate_presence_of(:transaction_number)
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
      should     allow_value("123456789").for(:from_bank_account_number_id)
    }
    it {
      should     allow_value("123456789").for(:to_bank_account_number_id)
    }
    it {
      should     allow_value("123456789").for(:transaction_number)
    }
  end

end