class GrecoTransactionDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator

end
