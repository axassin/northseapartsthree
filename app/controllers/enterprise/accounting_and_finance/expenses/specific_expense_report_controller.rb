class Enterprise::AccountingAndFinance::Expenses::SpecificExpenseReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_specific_expense_report_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path, 'Specific Expense Report')
  end

  def index

    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')
    @start_date = params[:start_date] || (Time.new - 6.months).strftime('%Y-%m-%d')
    @interval = params[:interval] || 'month'
    @expense_category_id = params[:expense_category_id] || ExpenseCategory.order("RAND()").first

  end

  def get_graph_data
    @end_date = params[:end_date]
    @start_date = params[:start_date]
    @interval = params[:interval]
    @expense_category_id = params[:expense_category_id]

    main_hash = Hash.new
    main_hash[:original] = ExpenseCategory.find_by_id(@expense_category_id).graph_data(@start_date, @end_date, @interval )

    render json: main_hash
  end

end
