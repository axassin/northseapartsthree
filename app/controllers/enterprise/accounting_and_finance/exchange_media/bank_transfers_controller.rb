class Enterprise::AccountingAndFinance::ExchangeMedia::BankTransfersController < GenericResourceController

  def setup_controller
    setup_variables( BankTransfer,
                     'Bank Transfer',
                     'Transfers from Financial Institutions',
                     [],
                     [],
                     @@routes.enterprise_accounting_and_finance_exchange_media_path)
  end

  def process_form(my_bank_transfer, current_params, wizard_mode = nil)

    bank_transfers_processing = Proc.new do
      my_contact_details.label = current_params[:label]
      polymorphic_reference_process(my_contact_details,'contactable',current_params)
      my_bank_transfer.save!
    end

    setup_process(my_bank_transfer, bank_transfers_processing, wizard_mode)

  end


end
