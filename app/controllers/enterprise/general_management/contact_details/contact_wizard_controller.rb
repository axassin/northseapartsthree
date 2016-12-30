class Enterprise::GeneralManagement::ContactDetails::ContactWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_system_account,
        :setup_contact_detail,
        :setup_telephone,
        :setup_link,
        :setup_location,
        :end

  def setup_wizard_controller
    setup_variables(@@routes.enterprise_general_management_contact_details_path,
                    @@routes.enterprise_general_management_contact_details_contact_wizard_index_path)
  end

  def show
    case step
      when :start
        setup_step(false)
      when :setup_system_account
        setup_step(false, Enterprise::SystemAccount)
      when :setup_contact_detail
        setup_step(false, Enterprise::GeneralManagement::ContactDetail)
      when :setup_telephone
        setup_step(true, Enterprise::GeneralManagement::ContactDetails::TelephoneNumber)
      when :setup_link
        setup_step(true, Enterprise::GeneralManagement::ContactDetails::Link)
      when :setup_location
        setup_step(true, Enterprise::GeneralManagement::ContactDetails::Location)
      when :end
        setup_step(false)
      else
    end
    render_step(params[:id])
  end

  def update
    case step
      when :start
      when :setup_system_account
        model_id = process_step(Enterprise::SystemAccount)
        @passable_parameters.store('enterprise_system_account_id',model_id)
      when :setup_contact_detail
        model_id = process_step(Enterprise::GeneralManagement::ContactDetail)
        @passable_parameters.store('enterprise_general_management_contact_detail_id',model_id)
      when :setup_telephone
        process_step(Enterprise::GeneralManagement::ContactDetails::TelephoneNumber)
        @passable_parameters.store('enterprise_general_management_contact_detail_id',
                                   params[:enterprise_general_management_contact_details_telephone_number][:contact_detail_id])
      when :setup_link
        process_step(Enterprise::GeneralManagement::ContactDetails::Link)
        @passable_parameters.store('enterprise_general_management_contact_detail_id',
                                   params[:enterprise_general_management_contact_details_link][:contact_detail_id])
      when :setup_location
        process_step(Enterprise::GeneralManagement::ContactDetails::Location)
        @passable_parameters.store('enterprise_general_management_contact_detail_id',
                                   params[:enterprise_general_management_contact_details_location][:contact_detail_id])
      when :end
      else
    end
    redirect_to @current_path + '/' + next_step.to_s + '?' + @passable_parameters.to_query
  end

end
