class ApplicationDecorator < Drape::Decorator

  delegate_all

  include TimestampDecorator
  include IdentificationDecorator

  require 'mab/kernel_method'

  def output_html_structure(html_structure)
    html_structure.to_s.html_safe
  end

  def polymorphic_owner

  end

  def owner

  end

  @@routes = Rails.application

end