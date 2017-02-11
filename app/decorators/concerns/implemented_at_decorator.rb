module ImplementedAt
  extend ActiveSupport::Concern

  def implemented_at
    object.created_at.strftime("%m/%d/%Y %r")
  end

end