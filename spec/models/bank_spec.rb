require 'rails_helper'

RSpec.describe Bank, type: :model do

  describe Bank do
    it {
      is_expected.to_not validate_inclusion_of(Remark)
    }
    # inheritance
    it {
      is_expected.to belong_to(:system_account)
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
      should have_many(:bank_accounts)
    end
  end


end