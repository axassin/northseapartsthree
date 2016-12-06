class Enterprise::GeneralManagement::ContactDetails::TelephoneNumberDecorator < ApplicationDecorator
  delegate_all

  include ContactableDecorator

  def digits

    telephone_number = object.digits.to_s
    href_link = 'tel:'+telephone_number

    digit_link_display = telephone_number
    if telephone_number.size > 15
      digit_link_display = telephone_number.slice(0,15) + '...'
    end


    main_element = mab do
      a :class => 'btn btn-default index-data-button', :href => href_link do
        digit_link_display
      end
    end

    main_element.html_safe
  end

end
