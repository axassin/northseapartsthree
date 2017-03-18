class Enterprise::AccountingAndFinance::ExchangeMedia::ChecksController < GenericResourceController

  def setup_controller
    setup_variables( Check,
                     'Check',
                     'Written Transfer',
                     ['exchange_medium_id','payee','signatory'],
                     ['exchange_summary','payee_name','signatory_name'],
                     @@routes.enterprise_accounting_and_finance_exchange_media_checks_path)
  end

  def process_form(my_check, current_params, wizard_mode = nil)

    check_processing = Proc.new do
      my_check.check_number = current_params[:check_number]
      my_check.dated = current_params[:dated]
      my_check.exchange_medium = ExchangeMedium.find_by_id(current_params[:exchange_medium_id])
      my_check.signatory = current_params[:signatory]
      my_check.payee = current_params[:payee]
      my_check.bank_account = BankAccount.find_by_id(current_params[:bank_account_id])
      my_check.save!
    end

    setup_process(my_check, check_processing, wizard_mode)
  end

end