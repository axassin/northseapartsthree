module GenericResourceHelper

  def primary_image_default(result)

    str = mab do
      if ( result.primary_image.url.present? && public_file_exists?(result.primary_image.url) )
        puts result.primary_image.url.present?
        puts public_file_exists?(result.primary_image.url)
        img.primary_image :src => result.primary_image.url
      else
        div :class => 'fa ' + result.class.class_variable_get(:@@resource_glyphicon) + ' resource_glyphicon',
            :style => 'width: 100%', :align => 'center'
        br
      end
    end
    output_html_structure(str)
  end

  def file_default(result)
    str = mab do
      if ( result.file.url.present? && public_file_exists?(result.file.url) )
        img.primary_image :src => result.primary_image.url
      else
        div :class => 'fa ' + result.class.class_variable_get(:@@resource_glyphicon) + ' resource_glyphicon',
            :style => 'width: 100%', :align => 'center'
        br
      end
    end
    output_html_structure(str)
  end

end