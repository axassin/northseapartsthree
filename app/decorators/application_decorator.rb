class ApplicationDecorator < Drape::Decorator

  delegate_all

  include TimestampDecorator
  include IdentificationDecorator

  require 'mab/kernel_method'

  def output_html_structure(html_structure)
    html_structure.to_s.html_safe
  end

  @@routes = Rails.application

end