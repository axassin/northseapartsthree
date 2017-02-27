module GenericDashboardHelper

  def button_set(button_array)
    render partial: 'common/dashboard/button_set', locals: {
        button_array: button_array
    }
  end

end
