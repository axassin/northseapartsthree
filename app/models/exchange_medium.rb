class ExchangeMedium < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'amount',
              @@routes.enterprise_accounting_and_finance_exchange_media_path,
              Enterprise::AccountingAndFinance::ExchangeMediaController )

  has_one :cash, :dependent => :destroy
  has_one :bank_transfer, :dependent => :destroy
  has_one :check, :dependent => :destroy

  validates_presence_of :transaction_id
  validates_presence_of :transaction_type
  validates_presence_of :exchange_medium_id
  validates_presence_of :exchange_medium_type
  validates_

end
