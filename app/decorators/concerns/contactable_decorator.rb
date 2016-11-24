module ContactableDecorator
  extend ActiveSupport::Concern

  def label
    object.label.to_s
  end

  def owner
    object.owner.to_s
  end

end