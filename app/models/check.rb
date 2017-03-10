class Check < ApplicationRecord

  include GenericResourceCommon
  include ExchangeableMedium

  setup_model('check-circle',
              'check_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_checks_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::ChecksController )

  belongs_to :system_account
  belongs_to :bank_account

  validates_presence_of :system_account
  validates_presence_of :bank_account
  validates_presence_of :check_number


end
