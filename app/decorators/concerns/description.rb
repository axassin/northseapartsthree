module Decorators::Description extend ActiveSupport::Concern

  def description
    object.description || ' N/A '
  end

end