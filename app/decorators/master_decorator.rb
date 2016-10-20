class MasterDecorator < Drape::Decorator

  delegate_all

  include Timestamps
  include Identification

end