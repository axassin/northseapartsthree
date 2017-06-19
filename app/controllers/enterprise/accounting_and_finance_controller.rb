class Enterprise::AccountingAndFinanceController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_path,
                     @@routes.enterprise_path, 'Accounting and Finance')
  end

  def index

  end

end
