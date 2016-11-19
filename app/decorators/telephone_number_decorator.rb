class TelephoneNumberDecorator < ApplicationDecorator
  delegate_all

  def label
    label = object.label.to_s
    str = mab do
      a label, :class => 'btn btn-default btn-xs grid-item-button', :href => ''
    end
    output_html_structure(str)
  end

  def owner
    owner = object.owner.to_s
    str = mab do
      a owner, :class => 'btn btn-default btn-xs grid-item-button', :href => ''
    end
    output_html_structure(str)
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
