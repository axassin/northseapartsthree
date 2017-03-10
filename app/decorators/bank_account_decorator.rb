class BankAccountDecorator < ApplicationDecorator
  delegate_all

  include SystemAccountableDecorator

  def bank

    link_path = object.bank.show_path
    link_label = object.bank.represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end
