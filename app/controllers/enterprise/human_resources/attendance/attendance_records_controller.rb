class Enterprise::HumanResources::Attendance::AttendanceRecordsController < GenericResourceController

  def setup_controller
    setup_variables( AttendanceRecord,
                     'Attendance Record',
                     'Record of Presence',
                     ['employee_id'],
                     ['associated_employee'],
                     @@routes.enterprise_human_resources_attendance_path)
  end

  def process_form(my_attendance_record, current_params, wizard_mode = nil)

    attendance_records_processing = Proc.new do
      my_attendance_record.employee = Employee.find(current_params[:employee_id])
      my_attendance_record.current_date = current_params[:current_date]
      my_attendance_record.time_in = current_params[:time_in]
      my_attendance_record.time_out = current_params[:time_out]
      my_attendance_record.remark = current_params[:remark]
      my_attendance_record.save!
    end

    setup_process(my_attendance_record, attendance_records_processing, wizard_mode)
  end

  def validate_overlap
    validation_token = true
    current_date_time_in = DateTime.strptime(params[:date_time_in], '%Y-%m-%dT%H:%M')
    current_date_time_out = DateTime.strptime(params[:date_time_out], '%Y-%m-%dT%H:%M')
    employee_id = params[:employee_id]

    AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
      other_date_time_in = DateTime.new(att_rec.current_date.year, att_rec.current_date.month, att_rec.current_date.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
      other_date_time_out = DateTime.new(att_rec.current_date.year, att_rec.current_date.month, att_rec.current_date.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )
      if ((current_date_time_in..current_date_time_out).overlaps?(other_date_time_in..other_date_time_out))
        puts '--------------- true condition detected -------------------'
        puts 'current_date_time_in: ' + current_date_time_in.to_s
        puts 'current_date_time_out: ' + current_date_time_out.to_s
        puts 'other_date_time_in: ' + other_date_time_in.to_s
        puts 'other_date_time_out: ' + other_date_time_out.to_s
        puts 'employee_id: ' + employee_id.to_s
        puts '---------------'
        validation_token = false
      end
    end
    puts 'validation_token: ' + validation_token.to_s
    render plain: validation_token.to_s
  end

end
