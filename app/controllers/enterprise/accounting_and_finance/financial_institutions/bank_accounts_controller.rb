class Enterprise::AccountingAndFinance::FinancialInstitutions::BankAccountsController < GenericResourceController

  def setup_controller
    setup_variables( BankAccount,
                     'Bank Account',
                     'Bank Transactions',
                     ['system_account_id', 'banks_id'],
                     ['bank_name','account_owner'],
                     @@routes.enterprise_accounting_and_finance_financial_institutions_bank_accounts_path)
  end

  def process_form(my_bank_account, current_params, wizard_mode = nil)

    bank_account_processing = Proc.new do
      my_bank_account.system_account = SystemAccount.find_by_id(current_params[:system_account_id])
      my_bank_account.bank = Bank.find_by_id(current_params[:bank_id])
      my_bank_account.remark = current_params[:remark]
      my_bank_account.account_number = current_params[:account_number]
      my_bank_account.save!
    end

    setup_process(my_bank_account, bank_account_processing, wizard_mode)
  end

end
