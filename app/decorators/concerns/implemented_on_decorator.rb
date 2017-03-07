module ImplementedOnDecorator
  extend ActiveSupport::Concern

  def implemented_on
    object.implemented_on.strftime("%m/%d/%Y")
  end

end