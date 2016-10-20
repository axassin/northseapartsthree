module Decorators::Identification extend ActiveSupport::Concern

  def id
    object.id.upcase
  end

end