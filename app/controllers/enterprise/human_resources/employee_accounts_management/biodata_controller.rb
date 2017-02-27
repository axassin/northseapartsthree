class Enterprise::HumanResources::EmployeeAccountsManagement::BiodataController < GenericResourceController

  def setup_controller
    setup_variables( Biodatum,
                     'Biodatum',
                     'Personal Details',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_employee_accounts_management_path)
  end

  def process_form(my_biodatum, current_params, wizard_mode = nil)

    biodatum_processing = Proc.new do
      my_biodatum.employee = Employee.find(current_params[:employee_id])
      my_biodatum.name_of_mother = current_params[:name_of_mother]
      my_biodatum.name_of_father = current_params[:name_of_father]
      my_biodatum.dependents = current_params[:dependents]
      my_biodatum.complexion = current_params[:complexion]
      my_biodatum.height = current_params[:height]
      my_biodatum.sex = current_params[:sex]
      my_biodatum.blood_type = current_params[:blood_type]
      my_biodatum.date_of_birth = current_params[:date_of_birth]
      my_biodatum.education = current_params[:education]
      my_biodatum.experience = current_params[:experience]
      my_biodatum.notable_accomplishment = current_params[:notable_accomplishment]
      my_biodatum.description = current_params[:description]
      my_biodatum.save!
    end

    setup_process(my_biodatum, biodatum_processing, wizard_mode)
  end

end
