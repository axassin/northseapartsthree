class Bank < ApplicationRecord

  include GenericResourceCommon
  setup_model('account_name',
              @@routes.enterprise_accounting_and_finance_financial_institutions_banks_path,
              Enterprise::AccountingAndFinance::FinancialInstitutions::BanksController)

  include SystemAccountSubModel
  include Remark

  has_many :bank_accounts, :dependent => :destroy
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy

  searchable_string(:account_name)

end
