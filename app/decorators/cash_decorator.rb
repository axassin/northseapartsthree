class CashDecorator < ApplicationDecorator
  delegate_all

  include ExchangeableMediumDecorator

end
