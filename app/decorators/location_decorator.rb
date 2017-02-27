class LocationDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

end
