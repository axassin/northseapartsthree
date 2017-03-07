class Check < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'amount',
              @@routes.enterprise_accounting_and_finance_exchange_media_checks_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::ChecksController )


end
