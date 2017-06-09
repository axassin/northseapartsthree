class ExpenseAssignment < ApplicationRecord

  include GenericResourceCommon
  include Remark

  setup_model('etsy',
              'expensable',
              @@routes.enterprise_accounting_and_finance_expenses_expense_assignments_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseAssignmentsController )

  belongs_to :expensable, polymorphic: true
  belongs_to :expense_entry

  validates_presence_of :expense_entry_id
  validates :expensable_type, inclusion: {in: ['Vehicle','Employee','Branch']}

  def expense_entry_summary
    ExpenseEntry.find_by_id(expense_entry_id).represent
  end

  def expensable
    expensable_type.constantize.find_by_id(expensable_id).represent
  end

  searchable_string :expense_entry_summary
  searchable_string :expensable
end
