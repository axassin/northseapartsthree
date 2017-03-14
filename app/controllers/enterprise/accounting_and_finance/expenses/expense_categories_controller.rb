class Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseCategory,
                     'Expense Category',
                     'Categories of an Expense',
                     ['parent_id'],
                     ['parent'],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path)
  end

  def process_form(my_cash, current_params, wizard_mode = nil)

    # try
    cash_processing = Proc.new do
      my_cash.exchange_medium = ExchangeMedium.find_by_id(current_params[:exchange_medium_id])
      my_cash.reference_number = current_params[:reference_number]
      my_cash.denomination = current_params[:denomination]
      my_cash.save!
    end

    setup_process(my_cash, cash_processing, wizard_mode)
  end


end
