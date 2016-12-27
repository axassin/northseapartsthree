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
    case step
      when :start
        setup_step(false)
      when :setup_system_account
        setup_step(false, '/enterprise/system_accounts', Enterprise::SystemAccount)
      when :setup_contact_detail
        setup_step(false)
      when :setup_telephone_numbers
        setup_step(true)
      when :setup_link
        setup_step(true)
      when :setup_location
        setup_step(true)
      when :end
        setup_step(false)
      else
    end
    render_step(params[:id])
  end

  def update
    @user = Enterprise::SystemAccount.new
    case step
      when :start
      when :setup_system_account
      when :setup_contact_detail
      when :setup_telephone
      when :setup_link
      when :setup_location
      when :end
      else
    end
    render_wizard @user
  end

end
