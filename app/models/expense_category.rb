class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  setup_model('buysellads',
              'summary',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expense::ExpenseCategoriesController )

  validates_presence_of :parent_id

end
