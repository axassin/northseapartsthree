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
        :setup_regular_work_period,
        :setup_rest_day,
        :setup_associated_image,
        :setup_associated_file,
        :end

  def setup_controller
    setup_variables(@@routes.enterprise_human_resources_employee_accounts_management_path,
                    @@routes.enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path)
  end

  def show

    set_employee_id = Proc.new do
      @employee_id = Employee.where(system_account_id: params[:wizard_model_id]).last.id
    end

    set_contact_detail_id = Proc.new do
      @contact_detail_id = ContactDetail.where(contactable_id: params[:wizard_model_id],
                                               contactable_type: SystemAccount).last.id
    end

    case step
      when :start
        setup_step
      when :setup_system_account
        setup_step(SystemAccount)
      when :setup_contact_detail
        setup_step(ContactDetail)
      when :setup_telephone
        set_contact_detail_id.call
        setup_step(TelephoneNumber, true, true)
      when :setup_link
        set_contact_detail_id.call
        setup_step(Link, true, true)
      when :setup_location
        set_contact_detail_id.call
        setup_step(Location, true, true)
      when :setup_employee
        setup_step(Employee)
      when :setup_biodatum
        set_employee_id.call
        setup_step(Biodatum)
      when :setup_employee_status
        set_employee_id.call
        setup_step(EmployeeStatus)
      when :setup_regular_work_period
        set_employee_id.call
        setup_step(RegularWorkPeriod)
      when :setup_rest_day
        set_employee_id.call
        setup_step(RestDay)
      when :setup_associated_image
        set_employee_id.call
        setup_step(AssociatedImage, true, true)
      when :setup_associated_file
        set_employee_id.call
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
        @mother_parameters.store('wizard_model_type','SystemAccount')
        @mother_parameters.store('wizard_model_id',params[:system_account][:wizard_model_id])
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
      when :setup_regular_work_period
        process_step(RegularWorkPeriod)
      when :setup_rest_day
        process_step(RestDay)
      when :setup_associated_image
        process_step(AssociatedImage)
      when :setup_associated_file
        process_step(AssociatedFile)
      when :end
    end
    update_finish
  end

end
