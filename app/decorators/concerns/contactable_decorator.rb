module ContactableDecorator
  extend ActiveSupport::Concern

  def label
    label = object.label
    contact_details_link = '/enterprise/general_management/contact_details/' + object.label_id
    main_element = mab do
      a :class => 'btn btn-default index-data-button', :href => contact_details_link do
        label
      end
    end
    main_element.html_safe
  end

  def owner
    owner = object.owner
    contact_details_owner = '/enterprise/system_accounts/' + object.owner_id
    main_element = mab do
      a :class => 'btn btn-default index-data-button', :href => contact_details_owner do
        owner
      end
    end
    main_element.html_safe
  end

end