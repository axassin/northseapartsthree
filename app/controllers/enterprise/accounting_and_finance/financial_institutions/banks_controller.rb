class Enterprise::AccountingAndFinance::FinancialInstitutions::BanksController < GenericResourceController

  def setup_controller
    setup_variables( Bank,
                     'Bank',
                     'Financial Services Provider',
                     ['system_account_id'],
                     ['bank_name'],
                     @@routes.enterprise_accounting_and_finance_financial_institutions_banks_path)
  end

  def process_form(my_bank, current_params, wizard_mode = nil)

    bank_processing = Proc.new do
      my_bank.system_account = SystemAccount.find_by_id(current_params[:system_account_id])
      my_bank.remark = current_params[:remark]
      my_bank.save!
    end

    setup_process(my_bank, bank_processing, wizard_mode)
  end

end
