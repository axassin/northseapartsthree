class MasterDecorator < Drape::Decorator

  delegate_all

  include TimestampDecorator
  include IdentificationDecorator

end