class Enterprise::GeneralManagement::ContactDetails::LinkDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

end
