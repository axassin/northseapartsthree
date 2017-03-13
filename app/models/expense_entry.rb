class ExpenseEntry < ApplicationRecord

  include GenericResourceCommon
  include Remark

  setup_model('exchange',
              'summary',
              @@routes.enterprise_accounting_and_finance_expenses_expense_entry_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseEntriesController )

  belongs_to :vendor
  belongs_to :expense_category

  validates_presence_of :vendor_id
  validates_presence_of :expense_category_id
  validates_presence_of :due_date

  monetize :amount_centavos, with_model_currency: :currency

  def summary
    ExchangeMedium.find_by_id(exchange_medium_id).summary
  end

  def vendor_summary
    Vendor.find_by_id(vendor_id).represent
  end

  def expense_category_summary
    ExpenseCategory.find_by_id(expense_category_id).represent
  end

  searchable_string(:vendor_summary)
  searchable_string(:expense_category_summary)
  searchable_date(:due_date)

end
