class Enterprise::AccountingAndFinance::ExpensesController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_path,
                     @@routes.enterprise_accounting_and_finance_path)
  end

  def index

  end

end
