class Enterprise::AccountingAndFinance::ExchangeMedia::ChecksController < GenericResourceController

  def setup_controller
    setup_variables( Check,
                     'Check',
                     'Written Transfer',
                     [],
                     [],
                     @@routes.enterprise_accounting_and_finance_exchange_media_checks_path)
  end

end
