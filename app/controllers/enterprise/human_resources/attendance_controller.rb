class Enterprise::HumanResources::AttendanceController < GenericReportController

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

  end

  def process_attendance_grid

    if params.has_key?(:quick_attendance)
      quick_attendance = params[:quick_attendance]
      quick_attendance.each do |attendance_record|
        attendance_array = attendance_record.split(",")
        attendance_period = attendance_array[0].to_s
        employee_id = attendance_array[1].to_s
        begin
          if attendance_period == 'whole_day'
            attendance_date = Date.parse(attendance_array[2])
            time_in = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 8, 0 ,0)
            time_out = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 12, 0 ,0)
            AttendanceRecord.create!(employee_id: employee_id, implemented_on: attendance_date, time_in: time_in, time_out: time_out)
            time_in = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 13, 0 ,0)
            time_out = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 17, 0 ,0)
            AttendanceRecord.create!(employee_id: employee_id, implemented_on: attendance_date, time_in: time_in, time_out: time_out)
          elsif attendance_period == 'half_day'
            attendance_date = Date.parse(attendance_array[2])
            time_in = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 8, 0 ,0)
            time_out = Time.new(attendance_date.year, attendance_date.month, attendance_date.day, 12, 0 ,0)
            AttendanceRecord.create!(employee_id: employee_id, implemented_on: attendance_date, time_in: time_in, time_out: time_out)
          end
        rescue => ex
          flash[:main_notification] = ex
        end
      end

      redirect_to action: 'index',
                  branch_id: params[:branch_id],
                  start_attendance: params[:start_attendance],
                  end_attendance: params[:end_attendance]
    end

  end

  def index

  end

end
