class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name

  has_ancestry

  setup_model('etsy',
              'name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_categories_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseCategoriesController )

  def total_amount
    siblings = get_siblings
    siblings.each do |sibling|

    end
  end

  def parent_representation
    parent.represent
  end

end
