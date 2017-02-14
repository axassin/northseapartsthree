class Enterprise::HumanResources::Attendance::HolidaysController < GenericResourceController

  def setup_controller
    setup_variables( Holiday,
                     'Holiday',
                     'Days of Celebration',
                     [],
                     [],
                     @@routes.enterprise_human_resources_attendance_holidays_path)
  end

  def process_form(my_holiday, current_params, wizard_mode = nil)

    my_holiday_processing = Proc.new do
      my_holiday.implemented_at = current_params[:implemented_at]
      my_holiday.remark = current_params[:remark]
      my_holiday.name = current_params[:name]
      my_holiday.day_scheme_id = current_params[:day_scheme_id]
      my_holiday.save!
    end

    setup_process(my_holiday, my_holiday_processing, wizard_mode)
  end

  def unique_holiday_date
    implemented_at = params[:implemented_at]
    validation_token = true
    Holiday.all.each do |holiday|
      (validation_token = false) if (holiday.implemented_at.to_s == implemented_at.to_s)
    end
    render plain: validation_token.to_s
  end

end
