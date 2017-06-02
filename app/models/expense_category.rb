class ExpenseCategory < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include Name
  include Forecasting

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

    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    line_chart_array = Array.new
    original = Hash.new
    original_data = Hash.new
    current_date = start_date

    while current_date <= end_date
      start_range = current_date
      end_range = start_range + 1.send(interval)
      current_value = ExpenseEntry.total(ExpenseCategory.find_by_id(id), start_range, end_range).round(2)
      original_data[(current_date)] = current_value
      current_date = current_date + 1.send(interval)
    end

    original[:name] = 'Original'
    original[:data] = original_data
    line_chart_array.push(original)

    line_chart_array
  end

end