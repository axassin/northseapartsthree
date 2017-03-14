module SystemAccountableDecorator
  extend ActiveSupport::Concern

  def system_account

    link_path = object.system_account.show_path
    link_label = object.system_account.represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end