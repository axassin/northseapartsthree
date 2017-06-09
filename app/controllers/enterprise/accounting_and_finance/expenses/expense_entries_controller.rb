class Enterprise::AccountingAndFinance::Expenses::ExpenseEntriesController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseEntry,
                     'Expense Entry',
                     'Entry into an Expense Account',
                     ['reference_number','vendor_id','expense_category_id','requesting_party_id', 'amount_centavos', 'amount_currency'],
                     ['amount','ref','vendr','exp_cat','req'],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_entries_path)
  end

  def process_form(my_expense_entry, current_params, wizard_mode = nil)

    expense_entry_processing = Proc.new do
      my_expense_entry.vendor = Vendor.find_by_id(current_params[:vendor_id])
      my_expense_entry.expense_category = ExpenseCategory.find_by_id(current_params[:expense_category_id])
      my_expense_entry.due_date = current_params[:due_date]
      my_expense_entry.requesting_party_id = current_params[:requesting_party_id]
      my_expense_entry.reference_number = current_params[:reference_number]
      process_money(my_expense_entry, current_params[:amount], current_params[:currency])
      my_expense_entry.remark = current_params[:remark]
      my_expense_entry.save!
    end

    setup_process(my_expense_entry, expense_entry_processing, wizard_mode)
  end

end
