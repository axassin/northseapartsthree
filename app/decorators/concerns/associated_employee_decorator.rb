module AssociatedEmployeeDecorator
  extend ActiveSupport::Concern

  def employee

    link_path = object.employee.show_path
    link_label = object.employee.represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end