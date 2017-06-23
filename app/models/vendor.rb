class Vendor < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable

  setup_model('vine',
              'account_name',
              @@routes.enterprise_accounting_and_finance_vendors_report_vendors_path,
              Enterprise::AccountingAndFinance::VendorsReport::VendorsController)

  has_many :expense_entries

  validates_uniqueness_of :system_account, if: :system_account

  belongs_to :system_account
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy

end