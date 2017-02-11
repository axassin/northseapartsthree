class RestDayDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator

end
