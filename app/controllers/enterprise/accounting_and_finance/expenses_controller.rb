class Enterprise::AccountingAndFinance::ExpensesController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_path,
                     @@routes.enterprise_accounting_and_finance_path, 'Expenses Dashboard')
  end

  def index

  end

end
