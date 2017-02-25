class Enterprise::HumanResources::Attendance::EmployeeAttendanceReportController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_employee_attendance_report_path,
                     @@routes.enterprise_human_resources_attendance_path)

    current_employee = params[:employee_id] || Employee.ids.sample(1)

    @employee = Employee.find_by_id(current_employee)
    @start_attendance = params[:start_attendance] || (Time.new - 3.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

  end

  def index

  end

  def get_attendance_records
    attendance_date = params[:attendance_date]
    attendance_records = AttendanceRecord.where(employee_id: @employee.id, implemented_at: attendance_date)
    render json: attendance_records
  end

  def get_regular_work_period
    attendance_date = params[:attendance_date]
    employee_id = params[:employee_id]
    render json: RegularWorkPeriod.current_work_period(attendance_date, employee_id)
  end

end
