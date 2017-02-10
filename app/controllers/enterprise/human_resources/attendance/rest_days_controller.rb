class Enterprise::HumanResources::Attendance::RestDaysController < GenericResourceController

  def setup_controller
    setup_variables( RestDay,
                     'Rest Days',
                     'One Day of the Week for Rest according to Law',
                     [],
                     [],
                     @@routes.enterprise_human_resources_attendance_rest_days_path)
  end

  def process_form(my_rest_day, current_params, wizard_mode = nil)

    rest_day_processing = Proc.new do
      my_rest_day.employee = Employee.find(current_params[:employee_id])
      my_rest_day.implemented_at = current_params[:implemented_at]
      my_rest_day.remark = current_params[:remark]
      my_rest_day.day = current_params[:day]
      my_rest_day.save!
    end

    setup_process(my_rest_day, rest_day_processing, wizard_mode)
  end

end
