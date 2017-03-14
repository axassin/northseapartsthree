class CheckDecorator < ApplicationDecorator
  delegate_all

  include ExchangeableMediumDecorator

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

  def bank_account

    link_path = object.bank_account.show_path
    link_label = object.bank_account.represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

  def payee

    link_path = SystemAccount.find_by_id(object.payee).show_path
    link_label = SystemAccount.find_by_id(object.payee).represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

  def signatory

    link_path = SystemAccount.find_by_id(object.signatory).show_path
    link_label = SystemAccount.find_by_id(object.signatory).represent

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe

  end

end
