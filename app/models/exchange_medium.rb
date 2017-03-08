class ExchangeMedium < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'amount',
              @@routes.enterprise_accounting_and_finance_exchange_media_path,
              Enterprise::AccountingAndFinance::ExchangeMediaController )

  include Remark
  include ImplementedAt

  has_one :cash, :dependent => :destroy
  has_one :bank_transfer, :dependent => :destroy
  has_one :check, :dependent => :destroy

  validates_presence_of :transaction_id
  validates_presence_of :transaction_type
  validates_numericality_of :amount
  validates_presence_of :currency

end
