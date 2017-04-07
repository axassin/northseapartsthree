class Enterprise::AccountingAndFinance::FinancialInstitutionsController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_financial_institutions_path,
                     @@routes.enterprise_accounting_and_finance_path)
  end

  def index

  end

end
