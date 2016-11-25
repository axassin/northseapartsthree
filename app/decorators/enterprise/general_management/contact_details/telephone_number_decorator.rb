class Enterprise::GeneralManagement::ContactDetails::TelephoneNumberDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

end
