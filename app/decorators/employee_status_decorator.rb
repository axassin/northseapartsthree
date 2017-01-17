class EmployeeStatusDecorator < ApplicationDecorator
  delegate_all

  def implemented_at
    object.implemented_at.strftime("%m/%d/%Y")
  end

  def owner_name

    link_label = object.employee.represent
    link_path = object.employee.show_path

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end
