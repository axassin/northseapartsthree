class Cash < ApplicationRecord

  include GenericResourceCommon
  include ExchangeableMedium

  setup_model('reference_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_cashes_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::CashesController )


end
