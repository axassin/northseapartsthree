class AssociatedImageDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def file_link

    file_link = object.image.url

    main_element = mab do
      img :class => 'primary_image', :src => file_link, :target => '_new'
    end

    main_element.html_safe
  end

end
