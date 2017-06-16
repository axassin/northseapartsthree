module CellHelper

  def format_datetime_at(result_implemented_at)
    result_implemented_at.strftime('%m/%d/%Y %r')
  end

  def format_date_on(result_implemented_on)
    result_implemented_on.strftime('%m/%d/%Y')
  end

  def format_time(result_implemented_on)
    result_implemented_on.strftime('%r')
  end

  def instance_link(instance)

    unless instance == nil
      link_path = instance.show_path
      link_label = instance.represent

      if link_label.size > 25
        link_label = link_label.slice(0,25) + ' ... '
      end

      main_element = mab do
        a :class => 'btn btn-default', :href => link_path, :target => '_new' do
          link_label
        end
      end

      main_element.html_safe
    else
      'N/A'
    end

  end

  def associated_file_link(file_identifier, file_path )
    if file_path.present?
      link_to(file_path, file_identifier, class: 'btn btn-default', target: '_new')
    else
      'N/A'
    end
  end

  def associated_image_link(image_path)
    if image_path.present?
      image_tag(image_path, class: 'primary_image', target: '_new')
    else
      'N/A'
    end
  end



end