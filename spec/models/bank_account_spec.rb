require 'rails_helper'

RSpec.describe BankAccount, type: :model do

  describe BankAccount do
    # model variables
    it {
      is_expected.to validate_presence_of(:account_number)
    }
    # dependency injection
    it {
      is_expected.not_to validate_inclusion_of(GenericResourceCommon)
      is_expected.not_to validate_inclusion_of(Remark)
    }
    # inheritance
    it {
      is_expected.to belong_to(:system_account)
      is_expected.to belong_to(:bank)
    }
  end

  describe 'run model validity checking' do
    it {
      subject.valid?
    }
  end

end
