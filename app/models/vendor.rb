class Vendor < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable

  setup_model('vine',
              'account_name',
              @@routes.enterprise_accounting_and_finance_vendors_report_vendors_path,
              Enterprise::AccountingAndFinance::VendorsReport::VendorsController)

end