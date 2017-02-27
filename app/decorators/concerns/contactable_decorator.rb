module ContactableDecorator
  extend ActiveSupport::Concern

  def label

    label = object.label
    contact_details_link = object.contact_detail.show_path

    main_element = mab do
      a :class => 'btn btn-default', :href => contact_details_link, :target => '_new' do
        label
      end
    end

    main_element.html_safe

  end

  def owner

    contact_detail = object.contact_detail
    contact_type = contact_detail.contactable_type.constantize
    contact_id = contact_detail.contactable_id.to_s
    contact_object_representation = contact_type.find_by_id(contact_id).represent
    contact_object = contact_type.find_by_id(contact_id).show_path

    owner_link = contact_object

    main_element = mab do
      a :class => 'btn btn-default', :href => owner_link, :target => '_new' do
        contact_object_representation
      end
    end

    main_element.html_safe

  end



end