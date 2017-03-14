class Bank < ApplicationRecord

  include GenericResourceCommon
  setup_model('university',
              'bank_name',
              @@routes.enterprise_accounting_and_finance_financial_institutions_banks_path,
              Enterprise::AccountingAndFinance::FinancialInstitutions::BanksController)

  include Remark

  belongs_to :system_account
  has_many :bank_accounts, :dependent => :destroy

  def bank_name
    SystemAccount.find_by_id(system_account_id).name
  end

  searchable_string(:bank_name)

end
