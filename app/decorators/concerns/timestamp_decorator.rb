module TimestampDecorator
  extend ActiveSupport::Concern

  def created_at
    object.created_at.strftime("%m/%d/%Y %r")
  end

  def updated_at
    object.created_at.strftime("%m/%d/%Y %r")
  end

end