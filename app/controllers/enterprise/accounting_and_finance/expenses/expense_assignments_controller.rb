class Enterprise::AccountingAndFinance::Expenses::ExpenseAssignmentsController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_expense_assignments_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path)
  end

  def index

  end

end
