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

  def graph_data(start_date, end_date, interval)

    start_date_literal = Date.parse(start_date)
    end_date_literal = Date.parse(end_date)
    sum_array = []
    current_attendance = start_date_literal
    while current_attendance <= end_date_literal
      start_range = current_attendance
      end_range = start_range + 1.send(interval)
      current_value = ExpenseEntry.total(ExpenseCategory.find_by_id(id),start_range , end_range)
      puts '----------- --------- --'
      puts current_attendance.to_s+'T00:00:00+00:00'
      sum_array.push(current_value)
      current_attendance = current_attendance + 1.send(interval)
    end
    sum_array
  end

end
