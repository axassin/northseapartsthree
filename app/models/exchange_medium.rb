class ExchangeMedium < ApplicationRecord

  include GenericResourceCommon
  setup_model('exchange',
              'remark',
              @@routes.enterprise_accounting_and_finance_exchange_media_path,
              Enterprise::AccountingAndFinance::ExchangeMediaController )

  include Remark
  include ImplementedAt

  has_one :cash, :dependent => :destroy
  has_one :bank_transfer, :dependent => :destroy
  has_one :check, :dependent => :destroy

  validates_presence_of :transaction_id
  validates_presence_of :transaction_type

  monetize :amount_centavos, with_model_currency: :currency

  def transaction
    'test n/a yet'
  end

  def type_of_medium
    if Check.exists?(:exchange_medium_id => id)
      'CHECK'
    elsif BankTransfer.exists?(:exchange_medium_id => id)
      'BANK TRANSFER'
    elsif Cash.exists?(:exchange_medium_id => id)
      'CASH'
    else
      'UNKNOWN'
    end
  end

  def summary
    amount.to_s + ' ' + amount_currency.to_s + ' '+ type_of_medium
  end

end
