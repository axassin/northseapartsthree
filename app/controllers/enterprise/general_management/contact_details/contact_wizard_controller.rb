class Enterprise::GeneralManagement::ContactDetails::ContactWizardController < WizardController

  steps :start,
        :setup_system_account,
        :setup_contact_detail,
        :setup_telephone,
        :setup_link,
        :setup_location,
        :end

  def show
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
