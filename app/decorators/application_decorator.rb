class ApplicationDecorator < Drape::Decorator

  delegate_all

  include TimestampDecorator
  include IdentificationDecorator

end