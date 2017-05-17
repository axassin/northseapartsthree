class ExpenseAuthorizationDecorator < ApplicationDecorator
  delegate_all

  include ImplementedOnDecorator
  include AssociatedEmployeeDecorator

  def expense_entry

    link_path = object.expense_entry.show_path
    link_label = object.expense_entry.represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end
