module GenericFieldHelper

  def button_set(button_array)
    render partial: 'shared/generic_field/button_set', locals: {
        button_array: button_array
    }
  end

  def generic_date_field(name, default_value = Date.today)
    main_element = mab do
      input :type => 'date', :name => name, :id => name, :max => '3000-01-01', :min => '1900-01-01', :value => default_value
    end
    main_element.html_safe
  end

  def generic_number_field(name, default_value = 0)
    main_element = mab do
      input :type => 'number', :name => name, :id => name, :max => '1000', :min => '0', :value => default_value
    end
    main_element.html_safe
  end

  def generic_submit_button(default_class = 'fa fa-search', default_text = '')
    main_element = mab do
      span do
        '&nbsp;'
      end
      button :type => 'submit', :class => 'btn btn-default btn-xs report_submit' do
        span :class => default_class do
          default_text
        end
      end
    end
    main_element.html_safe
  end

  def generic_add_button
    main_element = mab do
      span do
        '&nbsp;'
      end
      button :type => 'submit', :class => 'btn btn-default btn-xs report_submit' do
        span :class => 'fa fa-plus-circle'
      end
    end
    main_element.html_safe
  end

  def generic_model_selector(scoped_class_model, name, selected, value_method = 'id', label_method = 'represent')
    render partial: 'shared/generic_field/generic_model_selector', locals: {
        scoped_class_model: scoped_class_model,
        name: name,
        label_method: label_method,
        value_method: value_method,
        selected: selected
    }
  end

  def generic_selector(selection_array, name, selected = nil)
    render partial: 'shared/generic_field/generic_selector', locals: {
        selection_array: selection_array,
        name: name,
        selected: selected
    }
  end

  def render_expense_category_sub_accounts(account_array, current_attendance, start_date, end_date)
    render partial: 'shared/generic_field/expense_report_sub_accounts', locals: {
        account_array: account_array,
        current_attendance: current_attendance,
        start_date: start_date,
        end_date: end_date
    }
  end

  def percentage_display(name,value)
    render partial: 'shared/generic_field/percentage_display', locals: {
        name: name,
        value: value
    }
  end

end
