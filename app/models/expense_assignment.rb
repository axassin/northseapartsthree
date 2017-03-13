class ExpenseAssignment < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable

  setup_model('foursquare',
              'summary',
              @@routes.enterprise_accounting_and_finance_expenses_expense_assignments_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseAssignmentsController )

  validates_presence_of :expense_entry_id

  def summary
    ExchangeMedium.find_by_id(exchange_medium_id).amount + ' of ' + SystemAccount.find_by_id(system_account_id).name
  end

  def expense_entry_summary
    ExpenseEntry.find_by_id(expense_entry_id).represent
  end

  searchable_string :expense_entry_summary

end
