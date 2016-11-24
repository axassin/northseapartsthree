class Enterprise::GeneralManagement::ContactDetails::LocationDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

end
