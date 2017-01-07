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

    owner = object.owner.represent
    owner_link = object.owner.show_path

    main_element = mab do
      a :class => 'btn btn-default', :href => owner_link, :target => '_new' do
        owner
      end
    end

    main_element.html_safe

  end



end