module GenericReportHelper

  def button_set(button_array)
    render partial: 'common/report/button_set', locals: {
        button_array: button_array
    }
  end

  def report_date_input(name, default_value = Date.today)
    main_element = mab do
      input :type => 'date', :name => name, :id => name, :max => '3000-01-01', :min => '1900-01-01', :value => default_value
    end
    main_element.html_safe
  end

  def report_submit_button
    main_element = mab do
      span do
        '&nbsp;'
      end
      button :type => 'submit', :class => 'btn btn-default btn-xs report_submit' do
        span :class => 'fa fa-search'
      end
    end
    main_element.html_safe
  end

  def report_model_selector(scoped_class_model, name, selected, value_method = 'id', label_method = 'represent')
    render partial: 'common/report/report_model_selector', locals: {
        scoped_class_model: scoped_class_model,
        name: name,
        label_method: label_method,
        value_method: value_method,
        selected: selected
    }
  end

  def report_selector(selection_array, name, selected = nil)
    render partial: 'common/report/report_selector', locals: {
        selection_array: selection_array,
        name: name,
        selected: selected
    }
  end

  def render_expense_category_sub_accounts(account_array)
    render partial: 'common/report/expense_report_sub_accounts', locals: {
        account_array: account_array
    }
  end

  def percentage_display(name,value)
    render partial: 'common/report/percentage_display', locals: {
        name: name,
        value: value
    }
  end

end
