class Enterprise::HumanResources::Attendance::RegularWorkPeriodsController < GenericResourceController

  def setup_controller
    setup_variables( RegularWorkPeriod,
                     'Regular Work Period',
                     'Work Period per Employee',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_attendance_regular_work_periods_path)
  end

  def process_form(my_regular_work_period, current_params, wizard_mode = nil)

    attendance_records_processing = Proc.new do
      my_regular_work_period.employee = Employee.find(current_params[:employee_id])
      my_regular_work_period.implemented_at = current_params[:implemented_at]
      my_regular_work_period.time_in = current_params[:time_in]
      my_regular_work_period.time_out = current_params[:time_out]
      my_regular_work_period[:one_hour_break] = (current_params[:one_hour_break] == 'true')
      my_regular_work_period.remark = current_params[:remark]
      my_regular_work_period.save!
    end

    setup_process(my_regular_work_period, attendance_records_processing, wizard_mode)
  end

  def validate_overlap

  end

end
