class AssociatedFileDecorator < ApplicationDecorator
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

    file_link = object.file.url
    file_label = object.file_identifier

    main_element = mab do
      if file_link
        a :class => 'btn btn-default', :href => file_link, :target => '_new' do
          file_label
        end
      else
        'N/A'
      end
    end

    main_element.html_safe

  end

end
