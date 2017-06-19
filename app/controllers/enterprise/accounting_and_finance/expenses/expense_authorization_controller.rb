class Enterprise::AccountingAndFinance::Expenses::ExpenseAuthorizationController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseAuthorization,
                     'Expense Authorization',
                     'Authorization Expenses',
                     ['expense_entry_id','employee_id'],
                     ['expense_entry_summary','employee_name'],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_authorization_index_path)
  end

  def process_form(my_expense_authorization, current_params, wizard_mode = nil)

    expense_authorization_processing = Proc.new do
      my_expense_authorization.expense_entry = ExpenseEntry.find_by_id(current_params[:expense_entry_id])
      my_expense_authorization.employee = Employee.find_by_id(current_params[:employee_id])
      my_expense_authorization.implemented_on = current_params[:implemented_on]
      my_expense_authorization.remark = current_params[:remark]
      my_expense_authorization.save!
    end

    setup_process(my_expense_authorization, expense_authorization_processing, wizard_mode)

  end

end
