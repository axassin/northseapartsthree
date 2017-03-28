class Enterprise::AccountingAndFinance::ExpensesController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_path,
                     @@routes.enterprise_accounting_and_finance_path)
  end

  def index

    @start_expenses = params[:start_expenses] || '2001-01-01'
    @end_expenses = params[:end_expenses] || Time.new.strftime('%Y-%m-%d')

    @root_expenses = ExpenseCategory.where(parent_id: nil)
  end

  def expand_expense

  end

end
