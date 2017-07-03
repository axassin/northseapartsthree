# System Accountable module declares the model as a sub-model of System Account;
# which is a base model for every entity described as a user of the system

module SystemAccountSubModel
  extend ActiveSupport::Concern

  included do

    belongs_to :system_account

    validates_presence_of :system_account
    validates_uniqueness_of :system_account

    searchable do
      text :account_name
      string :account_name
    end

    def account_name
      SystemAccount.find_by_id(system_account_id).name
    end

  end

end