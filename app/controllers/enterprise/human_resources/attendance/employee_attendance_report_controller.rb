class Enterprise::HumanResources::Attendance::EmployeeAttendanceReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_employee_attendance_report_path,
                     @@routes.enterprise_human_resources_attendance_path, 'Employee Attendance Report')

    @employee_id = params[:employee_id] || Employee.order("RAND()").first.id
    @employee = Employee.find_by_id(@employee_id)
    @start_attendance = params[:start_attendance] || (Time.new - 30.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')
    @absence_ratio = @employee.absence(Date.parse(@start_attendance),Date.parse(@end_attendance))
    @presence_ratio = @employee.presence(Date.parse(@start_attendance),Date.parse(@end_attendance))
    @tardiness_ratio = @employee.tardiness(Date.parse(@start_attendance),Date.parse(@end_attendance))

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
      title = '[ ' + time_in + ',' + time_out + ' ]'

      attendance_status = Employee.find_by_id(employee_id).attendance_status(implemented_on)
      background_color = ''
      case attendance_status
        when 'exact'
          background_color = 'lightgreen'
        when 'shifted'
          background_color = 'cyan'
        when 'overtime'
          background_color = 'violet'
        when 'undertime'
          background_color = 'gold'
        when 'no_record'
          background_color = 'indianred'
      end

      current_array = {title: title, start: start_time, end: end_time, allDay: 'false', backgroundColor: background_color}
      attendance_array.push(current_array)
    end

    render json: attendance_array
  end

end
