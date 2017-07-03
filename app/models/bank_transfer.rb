class BankTransfer < ApplicationRecord

  include GenericResourceCommon
  include ExchangeableMedium

  setup_model('transaction_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_bank_transfers_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::BankTransfersController )


  validates_presence_of :from_bank_account_number_id
  validates_presence_of :to_bank_account_number_id
  validates_presence_of :transaction_number

  def from_bank_acct
    BankAccount.find_by_id(from_bank_account_number_id).represent
  end

  def to_bank_acct
    BankAccount.find_by_id(to_bank_account_number_id).represent
  end

end
