class Enterprise::AccountingAndFinance::Expenses::RequestExpenseWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_expense_entry,
        :setup_associated_files,
        :setup_associated_images,
        :generate_voucher,
        :end

  def setup_controller
    setup_variables(@@routes.enterprise_accounting_and_finance_expenses_path,
                    @@routes.enterprise_accounting_and_finance_expenses_request_expense_wizard_index_path)
  end

  def show

    set_associated_parameters = Proc.new do
      @associated_class_model = 'ExpenseEntry'
      @associated_id = params[:wizard_model_id]
    end

    case step
      when :start
        setup_step
      when :setup_expense_entry
        setup_step(ExpenseEntry)
      when :setup_associated_files
        set_associated_parameters.call
        setup_step(AssociatedFile, true, true)
      when :setup_associated_images
        set_associated_parameters.call
        setup_step(AssociatedImage, true, true)
      when :generate_voucher
        setup_step(nil,true, false)
      when :end
        setup_step(nil)
    end
    show_finish
  end

  def update
    case step
      when :start
      when :setup_expense_entry
        process_step(ExpenseEntry, true)
      when :setup_associated_files
        process_step(AssociatedFile)
      when :setup_associated_images
        process_step(AssociatedImage)
      when :generate_voucher
        process_step(nil, false, false)
      when :end
        process_step(nil, false, true)
    end
    update_finish
  end

end
