class Enterprise::AccountingAndFinance::Expenses::ExpenseForecastingController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_expense_forecasting_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path, 'Expense Forecasting')
  end

  def index

    @expense_id = params[:expense_id] || Expense.order('RAND()').first.id

  end

end
