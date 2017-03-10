class CheckDecorator < ApplicationDecorator
  delegate_all

  include ExchangeableMediumDecorator

end
