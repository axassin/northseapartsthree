module GenericResourceHelper

  def image_preview(result, name = 'primary_image')
    instance_url = result.send(name).send('url')

    str = mab do
      if ( instance_url.present? && public_file_exists?(instance_url) )
        img.primary_image :src => instance_url
      else
        div :class => 'fa ' + result.class.class_variable_get(:@@resource_glyphicon) + ' resource_glyphicon',
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

end