class LinkDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

  def url

    link_proper = object.url.to_s


    service = object.service.to_s
    href_output = 'mailto:' + link_proper
    case service
      when 'EMAIL'
        href_output
      when 'SKYPE'
        href_output = 'skype:' + link_proper + '?call'
      else
        href_output
    end

    link_proper.size > 15 ? (link_display = link_proper.slice(0,32) + '...' ) : link_display = link_proper


    main_element = mab do
      a :class => 'btn btn-default index-data-button', :href => href_output do
        link_display
      end
    end

    main_element.html_safe

  end

end
