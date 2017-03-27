module GenericDashboardHelper

  def button_set(button_array)
    render partial: 'common/dashboard/button_set', locals: {
        button_array: button_array
    }
  end

  def dashboard_date_input(name, default_value, label)

    link_label = label
    main_element = mab do
      input :type => 'date', :name => name, :max => '3000-01-01', :min => '1900-01-01', :value => default_value do
        link_label
      end
    end

    main_element.html_safe

  end

end
