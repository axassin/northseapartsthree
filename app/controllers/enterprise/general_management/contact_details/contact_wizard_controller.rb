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
    setup_variables(@@routes.enterprise_general_management_path)
  end

  def show
    puts '-------------- ----------'
    puts 'iakw na ba s mr right?: ' + step.to_s
    case step
      when :start
        setup_step(false)
      when :setup_system_account
        setup_step(false, Enterprise::SystemAccount)

        puts '----------- - - ----------------- - '
        puts ' SHOW - setup_system_account '

      when :setup_contact_detail

        puts '----------- - - ----------------- - '
        puts ' SHOW - CONTACT DETAIL '

        setup_step(false, Enterprise::GeneralManagement::ContactDetail)
      when :setup_telephone_numbers
        setup_step(true, Enterprise::GeneralManagement::TelephoneNumber)
      when :setup_link
        setup_step(true, Enterprise::GeneralManagement::Link)
      when :setup_location
        setup_step(true, Enterprise::GeneralManagement::Location)
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
        puts '----------- - - ----------------- - '
        puts ' UPDATE - SETUP SYSTEM ACCOUNT '
      when :setup_contact_detail
      when :setup_telephone
      when :setup_link
      when :setup_location
      when :end
      else
    end

    redirect_to self.to_s.pluralize.underscore.gsub('::','/') + '/setup_contact_detail'
  end

end
