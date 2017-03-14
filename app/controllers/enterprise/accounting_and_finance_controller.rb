class Enterprise::AccountingAndFinanceController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_path,
                     @@routes.enterprise_path)
  end

  def index

  end

end
