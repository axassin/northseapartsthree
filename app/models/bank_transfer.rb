class BankTransfer < ApplicationRecord

  include GenericResourceCommon
  setup_model('google-wallet',
              'transaction_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_bank_transfers_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::BankTransfersController )

  belongs_to :exchange_medium

  validates_presence_of :from_bank_account
  validates_presence_of :to_bank_account
  validates_presence_of :transaction_number

end
