class Vendor < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable

  setup_model('vine',
              'account_name',
              @@routes.enterprise_accounting_and_finance_vendors_path,
              Enterprise::AccountingAndFinance::VendorsController)

end