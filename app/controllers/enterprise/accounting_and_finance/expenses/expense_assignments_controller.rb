class Enterprise::AccountingAndFinance::Expenses::ExpenseAssignmentsController < GenericResourceController

  def setup_controller
    setup_variables( ExpenseAssignment,
                     'Expense Assignment',
                     'Assign an Expense',
                     ['expensable_id','expensable_type','expense_entry_id'],
                     ['expensable','expense_entry_summary'],
                     @@routes.enterprise_accounting_and_finance_expenses_expense_assignments_path)
  end

  def process_form(my_expense_assignment, current_params, wizard_mode = nil)

    expense_assignment_processing = Proc.new do
      my_expense_assignment.expense_entry_id = ExpenseEntry.find_by_id(current_params[:expense_entry_id])
      polymorphic_reference_process(my_expense_assignment,'expensable',current_params)
      my_expense_assignment.remark = current_params[:remark]
      my_expense_assignment.save!
    end

    setup_process(my_expense_assignment, expense_assignment_processing, wizard_mode)
  end

end
