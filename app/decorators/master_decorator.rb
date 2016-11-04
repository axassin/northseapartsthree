class ApplicationDecorator < Drape::Decorator

  delegate_all

  include TimestampDecorator
  include IdentificationDecorator

  def build_html(assigns = {}, &blk)
    Mab::PrettyBuilder.new({source: source, h: h}.deep_merge(assigns), nil, &blk).to_s.html_safe
  end

end