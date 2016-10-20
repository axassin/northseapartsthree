module Timestamps extend ActiveSupport::Concern

  def created_at
    object.created_at.strftime("%m/%d/%y %r")
  end

  def updated_at
    object.created_at.strftime("%m/%d/%y %r")
  end

end