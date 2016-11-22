module GenericResourceHelper

  def primary_image_default(result, fa_glyphicon_code)

    str = mab do
      if ( result.primary_image.url.present? && public_file_exists?(result.primary_image.url) )
        img.primary_image :src => result.primary_image.url
      else
        div :class => 'fa ' + fa_glyphicon_code + ' resource_glyphicon', :style => 'width: 100%', :align => 'center'
        br
      end
    end
    output_html_structure(str)
  end

end