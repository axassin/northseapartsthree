class Enterprise::HumanResources::Payroll::ValesManagementController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_payroll_vales_management_path,
                     @@routes.enterprise_human_resources_payroll_path,
                     'Vales Management')

    @button_set = []
  end

  def index
    @employee_id = params[:employee_id] || Employee.order("RAND()").first.id
    @vale = Vale.where(employee_id: @employee_id).to_s
   # @vales = Vale.where(employee_id: @employee_id)
  end

end
