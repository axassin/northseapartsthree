class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name
  include Forecasting

  has_ancestry

  setup_model('name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController )

  validates_uniqueness_of :name

  def get_end_sub_accounts
  end

  def parent_representation
    parent.represent
  end

  def self.end_nodes
    ExpenseCategory.all.reject { |expense_category| expense_category.has_children? }
  end

  def setup_current_value_forecast(start_range, end_range)
    ExpenseEntry.total(ExpenseCategory.find_by_id(id), start_range, end_range).round(2)
  end

end