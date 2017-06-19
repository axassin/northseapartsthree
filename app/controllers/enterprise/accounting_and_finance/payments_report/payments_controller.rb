class Enterprise::AccountingAndFinance::PaymentsReport::PaymentsController < GenericResourceController

  def setup_controller
    setup_variables( Payment,
                     'Payments',
                     'Expense Payments to Entities',
                     ['system_account_id','employee_id','exchange_medium_id'],
                     ['account_name','employee_name','exchange_summary'],
                     @@routes.enterprise_accounting_and_finance_payments_report_payments_path)
  end

  def process_form(my_payment, current_params, wizard_mode = nil)

    payment_processing = Proc.new do
      my_payment.system_account = SystemAccount.find_by_id(current_params[:system_account_id])
      my_payment.employee = Employee.find_by_id(current_params[:employee_id])
      my_payment.exchange_medium = ExchangeMedium.find_by_id(current_params[:exchange_medium])
      my_payment.remark = current_params[:remark]
    end

    setup_process(my_payment, payment_processing, wizard_mode)
  end


end
