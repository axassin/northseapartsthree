class BankAccount < ApplicationRecord

  include GenericResourceCommon
  setup_model('summary',
              @@routes.enterprise_accounting_and_finance_financial_institutions_bank_accounts_path,
              Enterprise::AccountingAndFinance::FinancialInstitutions::BankAccountsController)

  include Remark

  belongs_to :system_account
  belongs_to :bank

  validates_presence_of :account_number

  def summary
    bank_name.to_s + ' ' + account_number.to_s
  end

  def account_owner
    SystemAccount.find_by_id(system_account_id).name
  end

  def bank_name
    Bank.find_by_id(bank_id).system_account.name
  end

  searchable_string(:account_owner)
  searchable_string(:bank_name)

end
