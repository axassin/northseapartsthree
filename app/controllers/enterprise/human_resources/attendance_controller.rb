class Enterprise::HumanResources::AttendanceController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_attendance_path,
                     @@routes.enterprise_human_resources_path)

    @branch_id = params[:branch_id] || Branch.order('RAND()').first.id

    @employee_set = Employee.active_branches(@branch_id, 'ACTIVE')
    @start_attendance = params[:start_attendance] || (Time.new - 6.days).strftime('%Y-%m-%d')
    @end_attendance = params[:end_attendance] || Time.new.strftime('%Y-%m-%d')

    printable_attendance_sheet_path = enterprise_human_resources_attendance_printable_attendance_sheet_path +
        '?branch_id=' + @branch_id.to_s + '&start_attendance=' + @start_attendance.to_s + '&end_attendance=' + @end_attendance.to_s

    @button_set = [[enterprise_human_resources_attendance_attendance_records_path,'ATTENDANCE RECORDS'],
                   [enterprise_human_resources_attendance_holidays_path,'HOLIDAYS'],
                   [enterprise_human_resources_attendance_regular_work_periods_path,'REGULAR WORK PERIODS'],
                   [enterprise_human_resources_attendance_rest_days_path,'REST DAYS'],
                   [enterprise_human_resources_attendance_employee_attendance_report_path,'EMPLOYEE ATTENDANCE REPORT'],
                   [printable_attendance_sheet_path,'PRINTABLE ATTENDANCE SHEET']]

    if Employee.exists?(:id => params[:current_employee])

      current_employee = Employee.find_by_id(params[:current_employee])
      add_attendance_period = params[:add_attendance_period]
      add_attendance_date = Date.parse(params[:add_attendance_date])

      begin

        if add_attendance_period == 'half_day'
          AttendanceRecord.create!(
              employee_id: current_employee.id,
              implemented_on: add_attendance_date,
              time_in: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 8, 0 ,0),
              time_out: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 12, 0 ,0)
          )
        elsif add_attendance_period == 'whole_day'
          AttendanceRecord.create!(
              employee_id: current_employee.id,
              implemented_on: add_attendance_date,
              time_in: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 8, 0 ,0),
              time_out: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 12, 0 ,0)
          )
          AttendanceRecord.create!(
              employee_id: current_employee.id,
              implemented_on: add_attendance_date,
              time_in: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 13, 0 ,0),
              time_out: Time.new(add_attendance_date.year, add_attendance_date.month, add_attendance_date.day, 17, 0 ,0)
          )
        end

      rescue => ex
        flash[:main_notification] = ex
      end

      redirect_to action: 'index', branch_id: current_employee.branch.id
    end
  end

  def index

  end

end
