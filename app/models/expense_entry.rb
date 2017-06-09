class ExpenseEntry < ApplicationRecord

  include GenericResourceCommon
  include Remark

  setup_model('etsy',
              'summary',
              @@routes.enterprise_accounting_and_finance_expenses_expense_entries_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseEntriesController )

  belongs_to :vendor
  belongs_to :expense_category
  has_one :expense_authorization
  has_many :expense_assignments
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy

  validates_presence_of :requesting_party_id
  validates_presence_of :vendor_id
  validates_presence_of :expense_category_id
  validates_presence_of :due_date
  validates_presence_of :reference_number
  validate :expense_category_no_children

  monetize :amount_centavos, with_model_currency: :currency

  def expense_category_no_children
    expense_category = ExpenseCategory.find_by_id(expense_category_id)
    errors.add(:expense_category, 'Expense Category must have no sub accounts') if expense_category.has_children?
  end

  def summary
    amount.to_s + ' ' + amount_currency.to_s + ' for ' + vendor_summary
  end

  def amount_summary
    amount.to_s + ' ' + amount_currency.to_s
  end

  def vendor_summary
    Vendor.find_by_id(vendor_id).represent
  end

  def expense_category_summary
    ExpenseCategory.find_by_id(expense_category_id).represent
  end

  def requesting_party_summary
    Employee.find_by_id(requesting_party_id).represent
  end

  def self.total(expense_category, start_date, end_date)

    if expense_category.has_children?
      sum = 0
      expense_category.children.each do |category|
        sum = sum + total(category, start_date, end_date)
      end
    else
      total = 0
      expense_entries = ExpenseEntry.where(:due_date => start_date..end_date, :expense_category => expense_category)
      expense_entries.each do |expense_entry|
        if expense_entry.expense_authorization.present?
          current_amount = goog_currency_php_converter(expense_entry.amount, expense_entry.amount_currency)
          total = total + current_amount
        end
      end
      sum = total
    end
    sum

  end

  def self.unprocessed(start_date, end_date)
    ExpenseEntry.left_outer_joins(:expense_authorization)
        .where(expense_authorizations: {id: nil}, due_date: start_date..end_date)
        .order(due_date: :asc)
  end

  def self.approved(start_date, end_date)
    ExpenseEntry.left_outer_joins(:expense_authorization)
        .where('expense_authorizations.status = ?', 'APPROVED')
        .where(due_date: start_date..end_date)
        .order(due_date: :asc)
  end

  def self.denied(start_date, end_date)
    ExpenseEntry.left_outer_joins(:expense_authorization)
        .where('expense_authorizations.status = ?', 'DENIED')
        .where(due_date: start_date..end_date)
        .order(due_date: :asc)
  end

  searchable_string(:vendor_summary)
  searchable_string(:expense_category_summary)
  searchable_string(:requesting_party_summary)
  searchable_date(:due_date)
  searchable_string(:reference_number)

end
