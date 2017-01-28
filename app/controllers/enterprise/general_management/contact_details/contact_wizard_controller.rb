class Enterprise::GeneralManagement::ContactDetails::ContactWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_wizard_model,
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
        setup_step(nil, false, false, true)
      when :setup_wizard_model
        @label_method = 'name'
        case params[:wizard_model]
          when 'new_system_account'
            setup_step(SystemAccount)
          when 'new_branch'
            setup_step(Branch)
          when 'existing_system_account'
            @current_instance = SystemAccount.new
          when 'existing_branch'
            @current_instance = Branch.new
          else
            @restart = true
        end
      when :setup_contact_detail
        setup_step(ContactDetail)
      when :setup_telephone
        @contact_detail_id = ContactDetail.where(contactable_id: params[:wizard_model_id],
                                                 contactable_type: params[:wizard_model_type]).last.id
        setup_step(TelephoneNumber, true, true)
      when :setup_link
        @contact_detail_id = ContactDetail.where(contactable_id: params[:wizard_model_id],
                                                 contactable_type: params[:wizard_model_type]).last.id
        setup_step(Link, true, true)
      when :setup_location
        @contact_detail_id = ContactDetail.where(contactable_id: params[:wizard_model_id],
                                                 contactable_type: params[:wizard_model_type]).last.id
        setup_step(Location, true, true)
      when :end
        setup_step(nil, false)
      else
    end
    show_finish
  end

  def update
    case step
      when :start
      when :setup_wizard_model
        case params[:wizard_model]
          when 'new_system_account'
            process_step(SystemAccount, true)
          when 'new_branch'
            process_step(Branch, true)
          when 'existing_system_account'
            @mother_parameters.store('wizard_model_type','SystemAccount')
            @mother_parameters.store('wizard_model_id',params[:system_account][:wizard_model_id])
          when 'existing_branch'
            @mother_parameters.store('wizard_model_type','Branch')
            @mother_parameters.store('wizard_model_id',params[:branch][:wizard_model_id])
          else
            @restart = true
        end
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
