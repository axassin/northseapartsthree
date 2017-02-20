class Enterprise::HumanResources::AttendanceController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_path,
                     @@routes.enterprise_human_resources_path)

    current_branch = params[:branch] || Branch.ids.sample(1)

    @employee_set = Employee.active_branches(current_branch, 'ACTIVE')
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')
  end

  def index

  end

end
