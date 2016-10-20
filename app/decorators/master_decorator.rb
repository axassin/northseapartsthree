class MasterDecorator < Drape::Decorator

  delegate_all

  include Decorators::Timestamps
  include Decorators::Identification

end