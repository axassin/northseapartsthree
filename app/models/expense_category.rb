class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  has_ancestry

  setup_model('etsy',
              'name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController )

  def get_end_sub_accounts
  end

  def total_amount(date_start = '2000-01-01', date_end = '2100-01-01', interval = 'day')
    amount = 0
    ExpenseEntry.where()
  end

  def parent_representation
    parent.represent
  end

end
