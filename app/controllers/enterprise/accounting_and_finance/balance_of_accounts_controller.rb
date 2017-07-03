class Enterprise::AccountingAndFinance::BalanceOfAccountsController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_balance_of_accounts_path,
                     @@routes.enterprise_accounting_and_finance_path, 'Balance of Accounts')
  end

  def index

    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')
    @start_date = params[:start_date] || (Time.new - 6.months).strftime('%Y-%m-%d')
    @interval = params[:interval] || 'day'
    @system_account_id = params[:system_account_id] || Vendor.order("RAND()").first.system_account_id

    @starting_balance = 0 - Payment.balance(@start_date, @system_account_id)

  end

end
