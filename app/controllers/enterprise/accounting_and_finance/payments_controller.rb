class Enterprise::AccountingAndFinance::PaymentsController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_payments_path,
                     @@routes.enterprise_accounting_and_finance_path, 'Payments Dashboard')
  end

  def index

  end

end
