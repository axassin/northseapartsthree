class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  has_ancestry

  setup_model('etsy',
              'name',
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

end
