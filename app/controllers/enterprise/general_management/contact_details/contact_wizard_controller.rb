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
    show_finish
  end

  def update

    case step
      when :start
      when :setup_system_account
        process_step(Enterprise::SystemAccount)
      when :setup_contact_detail
        process_step(Enterprise::GeneralManagement::ContactDetail)
      when :setup_telephone
        process_step(Enterprise::GeneralManagement::ContactDetails::TelephoneNumber)
      when :setup_link
        process_step(Enterprise::GeneralManagement::ContactDetails::Link)
      when :setup_location
        process_step(Enterprise::GeneralManagement::ContactDetails::Location)
      when :end
      else
    end
    update_finish
  end

end
