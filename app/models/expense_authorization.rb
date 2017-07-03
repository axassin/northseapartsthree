class ExpenseAuthorization < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include AssociatedEmployee
  include ImplementedOn

  belongs_to :expense_entry

  validates :status, length: { in: 0..64 }, inclusion: {in: ['DENIED','APPROVED']}
  validates_uniqueness_of :expense_entry, if: :expense_entry

  setup_model('employee_name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_authorization_index_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseAuthorizationController )

  def expense_entry_summary
    ExpenseEntry.find_by_id(expense_entry_id).represent
  end

end
