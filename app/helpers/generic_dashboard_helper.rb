module GenericDashboardHelper

  def button_set(button_array)
    render partial: 'common/dashboard/button_set', locals: {
        button_array: button_array
    }
  end

  def dashboard_date_input(name, default_value = Date.today)
    main_element = mab do
      input :type => 'date', :name => name, :id => name, :max => '3000-01-01', :min => '1900-01-01', :value => default_value
    end
    main_element.html_safe
  end

  def dashboard_submit_button
    main_element = mab do
      input :class => 'btn btn-default btn-xs dashboard_submit', :type => 'submit', :style => 'padding: 0.5em', :value => 'Search'
    end
    main_element.html_safe
  end

  def dashboard_model_selector(scoped_class_model, name, selected, value_method = 'id', label_method = 'represent')
    render partial: 'common/dashboard/dashboard_model_selector', locals: {
        scoped_class_model: scoped_class_model,
        name: name,
        label_method: label_method,
        value_method: value_method,
        selected: selected
    }
  end

  def dashboard_selector(selection_array, name, selected)
    render partial: 'common/dashboard/dashboard_selector', locals: {
        selection_array: selection_array,
        name: name,
        selected: selected
    }
  end

end
