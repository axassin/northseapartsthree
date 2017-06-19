class Enterprise::HumanResources::Attendance::RestDaysController < GenericResourceController

  def setup_controller
    setup_variables( RestDay,
                     'Rest Days',
                     'One Day of the Week for Rest according to Law',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_attendance_rest_days_path)
  end

  def process_form(my_rest_day, current_params, wizard_mode = nil)

    rest_day_processing = Proc.new do
      my_rest_day.employee = Employee.find(current_params[:employee_id])
      my_rest_day.implemented_on = current_params[:implemented_on]
      my_rest_day.remark = current_params[:remark]
      my_rest_day.day = current_params[:day]
      my_rest_day.save!
    end

    setup_process(my_rest_day, rest_day_processing, wizard_mode)
  end

  def unique_rest_day_per_employee
    employee_id = params[:employee_id]
    implemented_on = params[:implemented_on]

    validation_token = true
    RestDay.all.where(employee_id: employee_id).each do |rest_day|
      (validation_token = false) if (rest_day.implemented_on.to_s == implemented_on.to_s)
    end
    render plain: validation_token.to_s
  end

end
