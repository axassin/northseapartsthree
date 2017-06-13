class Enterprise::AccountingAndFinance::ExchangeMedia::BankTransfersController < GenericResourceController

  def setup_controller
    setup_variables( BankTransfer,
                     'Bank Transfer',
                     'Transfers from Financial Institutions',
                     ['exchange_medium_id','to_bank_account_number_id','from_bank_account_number_id'],
                     ['amount','from_bank_acct','to_bank_acct'],
                     @@routes.enterprise_accounting_and_finance_exchange_media_path)
  end

  def process_form(my_bank_transfer, current_params, wizard_mode = nil)

    bank_transfer_processing = Proc.new do
      my_bank_transfer.exchange_medium = ExchangeMedium.find_by_id(current_params[:exchange_medium_id])
      my_bank_transfer.transaction_number = current_params[:transaction_number]
      my_bank_transfer.to_bank_account_number_id = current_params[:to_bank_account_number_id]
      my_bank_transfer.from_bank_account_number_id = current_params[:from_bank_account_number_id]
      my_bank_transfer.save!
    end

    setup_process(my_bank_transfer, bank_transfer_processing, wizard_mode)
  end


end
