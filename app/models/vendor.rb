class Vendor < ApplicationRecord

  include GenericResourceCommon

  setup_model('account_name',
              @@routes.enterprise_accounting_and_finance_vendors_report_vendors_path,
              Enterprise::AccountingAndFinance::VendorsReport::VendorsController)

  include SystemAccountSubModel

  has_many :expense_entries
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy

end