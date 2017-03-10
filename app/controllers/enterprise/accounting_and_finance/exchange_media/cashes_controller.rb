class Enterprise::AccountingAndFinance::ExchangeMedia::CashesController < GenericResourceController

  def setup_controller
    setup_variables( Cash,
                     'Cash',
                     'Cash Transfers',
                     ['exchange_medium_id'],
                     ['exchange_summary'],
                     @@routes.enterprise_accounting_and_finance_exchange_media_cashes_path)
  end

  def process_form(my_cash, current_params, wizard_mode = nil)

    cash_processing = Proc.new do
      my_cash.exchange_medium = ExchangeMedium.find_by_id(current_params[:exchange_medium_id])
      my_cash.reference_number = current_params[:reference_number]
      my_cash.denomination = current_params[:denomination]
      my_cash.save!
    end

    setup_process(my_cash, cash_processing, wizard_mode)
  end

end
