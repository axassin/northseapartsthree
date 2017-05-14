class Enterprise::AccountingAndFinance::Expenses::ExpenseAuthorizationController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseAuthorization,
                     'Expense Authorization',
                     'Authorize Requested Expenses',
                     [],
                     [],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_authorization_index_path)
  end

  def process_form(my_expense_entry, current_params, wizard_mode = nil)
  end

end
