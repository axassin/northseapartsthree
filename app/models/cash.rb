class Cash < ApplicationRecord

  include GenericResourceCommon
  setup_model('money',
              'reference_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_cashes_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::CashesController )

  belongs_to :exchange_medium

end
