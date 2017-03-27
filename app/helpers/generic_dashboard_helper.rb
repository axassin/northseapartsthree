module GenericDashboardHelper

  def button_set(button_array)
    render partial: 'common/dashboard/button_set', locals: {
        button_array: button_array
    }
  end

  def dashboard_date_input()

  end

  def dashboard_selector()

  end

end
