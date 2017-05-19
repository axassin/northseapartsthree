class Enterprise::AccountingAndFinance::Expenses::ExpenseReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_expense_report_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path, 'Expense Report')
  end

  def index

    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')
    @start_date = params[:start_date] || (Time.new - 6.months).strftime('%Y-%m-%d')

    @root_expenses = ExpenseCategory.roots
    @interval = params[:interval] || 'month'

    @button_set = [[enterprise_accounting_and_finance_expenses_path,'EXPENSE DASHBOARD']]

  end

end
