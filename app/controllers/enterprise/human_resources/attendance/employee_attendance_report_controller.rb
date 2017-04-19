class Enterprise::HumanResources::Attendance::EmployeeAttendanceReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_employee_attendance_report_path,
                     @@routes.enterprise_human_resources_attendance_path, 'Employee Attendance Report')

    @employee_id = params[:employee_id] || Employee.order("RAND()").first.id
    @employee = Employee.find_by_id(@employee_id)
    @start_attendance = params[:start_attendance] || (Time.new - 3.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

  end

  def index

  end

  def get_attendance_records
    attendance_date = params[:attendance_date]
    employee_id = params[:employee_id]
    attendance_records = AttendanceRecord.where(employee_id: employee_id, implemented_on: attendance_date)
    render json: attendance_records
  end

  def get_regular_work_period
    attendance_date = params[:attendance_date]
    employee_id = params[:employee_id]

    puts '--------------------- --------'
    puts attendance_date
    puts employee_id
    puts RegularWorkPeriod.current_work_period(attendance_date, employee_id)

    render json: RegularWorkPeriod.current_work_period(attendance_date, employee_id)
  end

  def get_full_calendar_data

    employee_id = params[:employee_id]
    attendance_array = []
    AttendanceRecord.where(employee_id: employee_id).each do |attendance_record|
      implemented_on = attendance_record.implemented_on.to_s
      time_in = attendance_record.time_in.strftime('%H:%M:%S').to_s
      time_out = attendance_record.time_out.strftime('%H:%M:%S').to_s
      start_time = implemented_on + 'T' + time_in
      end_time =  implemented_on + 'T' + time_out
      title = '[' + time_in + ',' + time_out + ']'

      current_array = {id: attendance_record.id, title: title, start_time: start_time, end_time: end_time, allDay: false}
      attendance_array.push(current_array)
    end

    puts attendance_array
    render plain: attendance_array
  end

end
