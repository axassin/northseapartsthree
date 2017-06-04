class Enterprise::AccountingAndFinance::Expenses::RequestExpenseWizardController < WizardController
  include Wicked::Wizard

  steps :start,
        :setup_expense_entry,
        :setup_associated_files,
        :setup_associated_images,
        :end

  def setup_controller
    setup_variables(@@routes.enterprise_accounting_and_finance_expenses_path,
                    @@routes.enterprise_accounting_and_finance_expenses_request_expense_wizard_index_path)
  end

  def show
    case step
      when :start
        setup_step
      when :setup_expense_entry
        setup_step(ExpenseEntry)
      when :setup_associated_files
        setup_step(AssociatedFile, true, true)
      when :setup_associated_images
        setup_step(AssociatedImage, true, true)
      when :end
        setup_step(nil)
    end
    show_finish
  end

  def update
    case step
      when :start
      when :setup_expense_entry
        process_step(ExpenseEntry)
      when :setup_associated_files
        process_step(AssociatedFile)
      when :setup_associated_images
        process_step(AssociatedImage)
      when :end
    end
    update_finish
  end

end
