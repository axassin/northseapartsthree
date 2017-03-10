class BankTransferDecorator < ApplicationDecorator
  delegate_all

  include ExchangeableMediumDecorator

end
