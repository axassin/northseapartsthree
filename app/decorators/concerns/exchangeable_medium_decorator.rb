module ExchangeableMediumDecorator
  extend ActiveSupport::Concern

  def exchange_medium

    link_path = object.exchange_medium.show_path
    link_label = object.exchange_summary

    main_element = mab do
      a :class => 'btn btn-default', :href => link_path, :target => '_new' do
        link_label
      end
    end

    main_element.html_safe


  end

end