class Enterprise::AccountingAndFinance::ExchangeMedia::CashesController < GenericResourceController

  def setup_controller
    setup_variables( Cash,
                     'Cash',
                     'Cash Transfers',
                     [],
                     [],
                     @@routes.enterprise_accounting_and_finance_exchange_media_cashes_path)
  end

end
