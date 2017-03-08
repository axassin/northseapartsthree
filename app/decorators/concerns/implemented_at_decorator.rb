module ImplementedAtDecorator
  extend ActiveSupport::Concern

  def implemented_at
    object.implemented_on.strftime("%m/%d/%Y %r")
  end

end