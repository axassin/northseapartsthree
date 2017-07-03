class Enterprise::AccountingAndFinance::PaymentsReportController < ApplicationController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_payments_report_path,
                     @@routes.enterprise_accounting_and_finance_path, 'Payments Report')
  end

  def index

    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')
    @start_date = params[:start_date] || (Time.new - 6.months).strftime('%Y-%m-%d')

    @button_set = [
        [enterprise_accounting_and_finance_payments_report_payments_path,'Payments'],
        [enterprise_accounting_and_finance_payments_report_accounts_payable_wizard_index_path, 'Accounts Payable Wizard']]

  end

end
