module ImplementedAtDecorator
  extend ActiveSupport::Concern

  def implemented_at
    object.implemented_at.strftime("%m/%d/%Y")
  end

  def implemented_at_date_time
    object.implemented_at.strftime("%m/%d/%Y %r")
  end

end