class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  setup_model('buysellads',
              'name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController )

end
