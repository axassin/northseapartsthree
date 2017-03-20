class ExpenseEntry < ApplicationRecord

  include GenericResourceCommon
  include Remark

  setup_model('etsy',
              'summary',
              @@routes.enterprise_accounting_and_finance_expenses_expense_entries_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseEntriesController )

  belongs_to :vendor
  belongs_to :expense_category

  validates_presence_of :receiving_party_id
  validates_presence_of :vendor_id
  validates_presence_of :expense_category_id
  validates_presence_of :due_date
  validates_presence_of :reference_number

  monetize :amount_centavos, with_model_currency: :currency

  def summary
    amount.to_s + ' ' + amount_currency.to_s + ' from ' + vendor_summary
  end

  def vendor_summary
    Vendor.find_by_id(vendor_id).represent
  end

  def expense_category_summary
    ExpenseCategory.find_by_id(expense_category_id).represent
  end

  def receiving_party_summary
    Employee.find_by_id(receiving_party_id).represent
  end

  searchable_string(:vendor_summary)
  searchable_string(:expense_category_summary)
  searchable_string(:receiving_party_summary)
  searchable_date(:due_date)
  searchable_string(:reference_number)

end
