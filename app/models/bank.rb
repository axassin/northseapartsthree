class Bank < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable
  include Remark

  setup_model('account_name',
              @@routes.enterprise_accounting_and_finance_financial_institutions_banks_path,
              Enterprise::AccountingAndFinance::FinancialInstitutions::BanksController)

  has_many :bank_accounts, :dependent => :destroy
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy

  searchable_string(:account_name)

end
