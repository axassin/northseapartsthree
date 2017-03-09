class Enterprise::AccountingAndFinance::ExchangeMediaController < GenericResourceController

  def setup_controller
    setup_variables( ExchangeMedium,
                     'Exchange Medium',
                     'Transfer of Liquid Assets',
                     ['transaction_type','transaction_id'],
                     ['transaction'],
                     @@routes.enterprise_accounting_and_finance_exchange_media_path)
  end

  def process_form(my_exchange_medium, current_params, wizard_mode = nil)

    exchange_medium_processing = Proc.new do
      my_exchange_medium.transaction_type = current_params[:transaction_type]
      my_exchange_medium.transaction_id = current_params[:transaction_id]
      my_exchange_medium.implemented_at = current_params[:implemented_at]
      my_exchange_medium.remark = current_params[:remark]
      process_money(my_exchange_medium, current_params[:amount], current_params[:currency])
      my_exchange_medium.save!
    end

    setup_process(my_exchange_medium, exchange_medium_processing, wizard_mode)

  end

end
