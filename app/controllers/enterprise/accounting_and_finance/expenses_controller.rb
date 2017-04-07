class Enterprise::AccountingAndFinance::ExpensesController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_path,
                     @@routes.enterprise_accounting_and_finance_path)
  end

  def index

    @start_expenses = params[:start_expenses] || '2001-01-01'
    @end_expenses = params[:end_expenses] || Time.new.strftime('%Y-%m-%d')
    @root_expenses = ExpenseCategory.roots

    @button_set = [[enterprise_accounting_and_finance_expenses_expense_assignments_path,'EXPENSE ASSIGNMENTS'],
                   [enterprise_accounting_and_finance_expenses_expense_categories_path,'EXPENSE CATEGORIES'],
                   [enterprise_accounting_and_finance_expenses_expense_entries_path,'EXPENSE ENTRIES']]

  end

end
