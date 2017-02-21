class Enterprise::HumanResources::AttendanceController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_path,
                     @@routes.enterprise_human_resources_path)

    current_branch = params[:branch] || Branch.ids.sample(1)

    @employee_set = Employee.active_branches(current_branch, 'ACTIVE')
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

    @button_set = [[enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path,'ATTENDANCE RECORDS'],
                   [enterprise_human_resources_employee_accounts_management_employees_path,'REST DAYS'],
                   [enterprise_human_resources_employee_accounts_management_biodata_path,'HOLIDAYS'],
                   [enterprise_human_resources_employee_accounts_management_employee_statuses_path,'REGULAR WORK PERIODS'],
                   [enterprise_human_resources_attendance_attendance_per_employee_path,'ATTENDANCE PER EMPLOYEE']]

  end

  def index

  end

end
