class BankTransfer < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'amount',
              @@routes.enterprise_accounting_and_finance_exchange_media_bank_transfers_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::BankTransfersController )

  

end
