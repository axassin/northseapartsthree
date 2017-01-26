class Enterprise::HumanResources::EmployeeAccountsManagement::NewEmployeeWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_system_account,
        :setup_contact_detail,
        :setup_telephone,
        :setup_link,
        :setup_location,
        :setup_employee,
        :setup_biodatum,
        :setup_employee_status,
        :setup_associated_image,
        :setup_associated_file,
        :end

  def setup_wizard_controller
    setup_variables(@@routes.enterprise_human_resources_employee_accounts_management_path,
                    @@routes.enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path)
  end

  def show
    mother_model_type = SystemAccount
    case step
      when :start
        setup_step
      when :setup_system_account
        setup_step(SystemAccount)
      when :setup_contact_detail
        setup_step(ContactDetail)
      when :setup_telephone
        setup_step(TelephoneNumber, true, true)
        @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id],
                                                 contactable_type: mother_model_type).last.id
      when :setup_link
        setup_step(Link, true, true)
        @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id],
                                                 contactable_type: mother_model_type).last.id
      when :setup_location
        setup_step(Location, true, true)
        @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id],
                                                 contactable_type: mother_model_type).last.id
      when :setup_employee
        setup_step(Employee)
      when :setup_biodatum
        setup_step(Biodatum)
      when :setup_employee_status
        setup_step(EmployeeStatus)
      when :setup_associated_image
        setup_step(AssociatedImage, true, true)
      when :setup_associated_file
        setup_step(AssociatedFile, true, true)
      when :end
        setup_step(nil)
    end
    show_finish
  end

  def update
    case step
      when :start
      when :setup_system_account
        @mother_parameters.store('mother_model_type','SystemAccount')
        @mother_parameters.store('mother_model_id',params[:system_account][:mother_model_id])
        process_step(SystemAccount, true)
      when :setup_contact_detail
        process_step(ContactDetail)
      when :setup_telephone
        process_step(TelephoneNumber)
      when :setup_link
        process_step(Link)
      when :setup_location
        process_step(Location)
      when :setup_employee
        process_step(Employee)
      when :setup_biodatum
        process_step(Biodatum)
      when :setup_employee_status
        process_step(EmployeeStatus)
      when :setup_associated_images
        process_step(AssociatedImage)
      when :setup_associated_files
        process_step(AssociatedFile)
      when :end
    end
    update_finish
  end

end
