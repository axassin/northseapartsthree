class Enterprise::AccountingAndFinance::Expenses::AssetExpendituresController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_expenses_asset_expenditures_path,
                     @@routes.enterprise_accounting_and_finance_expenses_path, 'Asset Expenditures')
  end

  def index

  end

end
