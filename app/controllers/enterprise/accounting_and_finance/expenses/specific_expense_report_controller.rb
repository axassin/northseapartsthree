class Enterprise::AccountingAndFinance::Expenses::SpecificExpenseReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_specific_expense_report_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path, 'Specific Expense Report')
  end

  def index

  end

  def get_graph_data

  end

end
