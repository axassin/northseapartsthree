class ExchangeMediumDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator

  def type_of_medium

    link_path = ''

    case object.type_of_medium
      when 'CHECK'
        link_path = Check.find_by(exchange_medium_id: id).show_path
      when 'CASH'
        link_path = Cash.find_by(exchange_medium_id: id).show_path
      when 'BANK TRANSFER'
        link_path = BankTransfer.find_by(exchange_medium_id: id).show_path
    end

    link_label = object.type_of_medium

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end
