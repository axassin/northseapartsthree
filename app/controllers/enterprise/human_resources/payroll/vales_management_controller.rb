class Enterprise::HumanResources::Payroll::ValesManagementController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_payroll_vales_management_path,
                     @@routes.enterprise_human_resources_payroll_path,
                     'Vales Management')

    @button_set = []
  end

  def index
    @employee_id = params[:employee_id] || Employee.order("RAND()").first.id
    @vales = Vale.where(employee_id: @employee_id) 
    @vale_adjustments = ValeAdjustment.where(employee_id: @employee_id)
    vale_sum = Vale.all.get_sum(@employee_id)
    vale_adjustment_sum_add = ValeAdjustment.all.get_sum_add(@employee_id)
    vale_adjustment_sum_deduct = ValeAdjustment.all.get_sum_deduct(@employee_id)
    @vale_total= vale_sum + vale_adjustment_sum_add - vale_adjustment_sum_deduct
  end

end
