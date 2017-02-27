class Enterprise::HumanResources::AttendanceController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_path,
                     @@routes.enterprise_human_resources_path)

    current_branch = params[:branch] || Branch.ids.sample(1)

    @employee_set = Employee.active_branches(current_branch, 'ACTIVE')
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

    @button_set = [[enterprise_human_resources_attendance_attendance_records_path,'ATTENDANCE RECORDS'],
                   [enterprise_human_resources_attendance_holidays_path,'HOLIDAYS'],
                   [enterprise_human_resources_attendance_regular_work_periods_path,'REGULAR WORK PERIODS'],
                   [enterprise_human_resources_attendance_rest_days_path,'REST DAYS'],
                   [enterprise_human_resources_attendance_employee_attendance_report_path,'EMPLOYEE ATTENDANCE REPORT']]

  end

  def index

  end

end
