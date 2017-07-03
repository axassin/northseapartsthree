class Enterprise::AccountingAndFinance::FinancialInstitutions::CreateBankWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_system_account,
        :setup_contact_detail,
        :setup_telephone,
        :setup_link,
        :setup_location,
        :setup_associated_image,
        :setup_associated_file,
        :end

  def setup_controller
    setup_variables(@@routes.enterprise_accounting_and_finance_financial_institutions_path,
                    @@routes.enterprise_accounting_and_finance_financial_institutions_create_bank_wizard_index_path)
  end

  def show

    set_associated_parameters = Proc.new do
      @associated_class_model = 'Bank'
      @associated_id = Bank.where(system_account_id: params[:wizard_model_id]).last.id
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
      when :setup_associated_image
        set_associated_parameters.call
        setup_step(AssociatedImage, true, true)
      when :setup_associated_file
        set_associated_parameters.call
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

        process_step(SystemAccount, true)

        begin
          bank = Bank.new
          bank.system_account = SystemAccount.find_by_id(@mother_parameters['wizard_model_id'])
          bank.save!
        rescue => ex
          puts ' --------- PROCESS ERROR START --------- '
          puts ex
          @wizard_response = ex
          puts ' ---------- PROCESS ERROR END ---------- '
        end

      when :setup_contact_detail
        process_step(ContactDetail)
      when :setup_telephone
        process_step(TelephoneNumber)
      when :setup_link
        process_step(Link)
      when :setup_location
        process_step(Location)
      when :setup_associated_image
        process_step(AssociatedImage)
      when :setup_associated_file
        process_step(AssociatedFile)
      when :end
    end
    update_finish

  end

end
