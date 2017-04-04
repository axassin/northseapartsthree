class Enterprise::HumanResources::Attendance::PrintableAttendanceSheetController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_printable_attendance_sheet_path,
                     @@routes.enterprise_human_resources_attendance_path)
  end

  def index

    @branch_id = params[:branch_id] || Branch.ids.sample(1)
    @employee_set = Employee.active_branches(@branch_id, 'ACTIVE')
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

  end

end
