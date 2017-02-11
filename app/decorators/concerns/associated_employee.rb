module AssociatedEmployee extend ActiveSupport::Concern

  def associated_employee_link

  'sherwin'

=begin
    link_label = object.employee.system_account.name
    link_path = object.employee.show_path

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe
=end

  end

end