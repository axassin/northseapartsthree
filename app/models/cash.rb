class Cash < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'amount',
              @@routes.enterprise_accounting_and_finance_exchange_media_cashes_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::CashesController )

  include ImplementedOn


end
