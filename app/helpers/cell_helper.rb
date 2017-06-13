module CellHelper

  def format_datetime_at(result_implemented_at)
    result_implemented_at.strftime('%m/%d/%Y %r')
  end

  def format_date_on(result_implemented_on)
    result_implemented_on.strftime('%m/%d/%Y')
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

  def associated_file_link()

  end

  def associated_image_link()

  end



end