class Enterprise::HumanResources::Payroll::DaySchemesController < GenericResourceController

  # Change this v
  def setup_controller
    setup_variables( DayScheme,
                     'Day Scheme',
                     'Types of Day Schemes',
                     [],
                     [],
                     @@routes.enterprise_human_resources_payroll_day_schemes_path)
  end

  def process_form(my_day_scheme, current_params, wizard_mode = nil)

    attendance_records_processing = Proc.new do
      my_day_scheme.type_name = Employee.find(current_params[:type_name])
      my_day_scheme.implemented_on = current_params[:implemented_on]
      my_day_scheme.base_multiplier = current_params[:base_multiplier]
      my_day_scheme.overtime_multiplier = current_params[:overtime_multiplier]
      my_day_scheme.rest_day_multiplier = current_params[:rest_day_multiplier]
      my_day_scheme.overtime_rest_day_multiplier = current_params[:overtime_rest_day_multiplier]
      my_day_scheme.remark = current_params[:remark]
      my_day_scheme.save!
    end

    setup_process(my_day_scheme, attendance_records_processing, wizard_mode)
  end

end
