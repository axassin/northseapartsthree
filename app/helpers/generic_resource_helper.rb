module GenericResourceHelper

  def image_preview(result, name = 'primary_image')
    instance_url = result.send(name).send('url')

    str = mab do
      if ( instance_url.present? && public_file_exists?(instance_url) )
        img.primary_image :src => instance_url
      else
        div :class => 'fa fa-' + result.class.class_variable_get(:@@resource_glyphicon) + ' resource_glyphicon',
            :style => 'width: 100%', :align => 'center'
        br
      end
    end
    output_html_structure(str)
  end

  def file_preview(result)

    instance_url = result.file.url

    str = mab do
      if ( instance_url.present? && public_file_exists?(instance_url) )
        a :class => 'btn btn-default', :href => instance_url do
          result.file_identifier
        end
      end
    end
    output_html_structure(str)
  end

  def horizontal_ruled_label(current_label)
    render partial: 'layouts/horizontal_ruled_label', locals: {
        current_label: current_label
    }
  end

  def resource_cell_link(resource)

    unless resource == nil
      link_path = resource.show_path
      link_label = resource.represent

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

end