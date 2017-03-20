class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  setup_model('etsy',
              'name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController )

  def parent
    ExpenseCategory.find_by_id(parent_id)
  end

  def parent_summary
    ExpenseCategory.find_by_id(parent_id).represent
  end

  def get_siblings
    ExpenseCategory.where(parent_id: parent_id)
  end

end
