class Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseCategory,
                     'Expense Category',
                     'Categories of an Expense',
                     ['parent_id'],
                     ['parent_summary'],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path)
  end

  def process_form(my_expense_category, current_params, wizard_mode = nil)

    expense_category_processing = Proc.new do
      my_expense_category.parent_id = current_params[:parent_id]
      my_expense_category.name = current_params[:name]
      my_expense_category.remark = current_params[:remark]
      my_expense_category.save!
    end

    setup_process(my_expense_category, expense_category_processing, wizard_mode)
  end


end
