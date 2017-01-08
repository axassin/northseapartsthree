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
        setup_step(nil, false)
      when :setup_system_account
        setup_step(SystemAccount, false)
      when :setup_contact_detail
        setup_step(ContactDetail, false)
      when :setup_telephone
        setup_step(TelephoneNumber, true, true)
        # @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id], contactable_type: 'SystemAccount').last
      when :setup_link
        setup_step(Link, true, true)
        # @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id], contactable_type: 'SystemAccount').last
      when :setup_location
        setup_step(Location, true, true)
        # @contact_detail_id = ContactDetail.where(contactable_id: params[:mother_model_id], contactable_type: 'SystemAccount').last
      when :end
        setup_step(nil, false)
      else
    end
    show_finish
  end

  def update

    case step
      when :start
      when :setup_system_account
        process_step(SystemAccount, true)
      when :setup_contact_detail
        process_step(ContactDetail)
      when :setup_telephone
        process_step(TelephoneNumber)
      when :setup_link
        process_step(Link)
      when :setup_location
        process_step(Location)
      when :end
        process_step(nil, false, true)
      else
    end
    update_finish
  end

end
