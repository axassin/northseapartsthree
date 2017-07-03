class Enterprise::AccountingAndFinance::VendorsReportController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_accounting_and_finance_vendors_report_path,
                     @@routes.enterprise_accounting_and_finance_path,
                     'Vendors Report')
  end

  def index

    @start_date = params[:start_date] || (Time.new - 3.months).strftime('%Y-%m-%d')
    @end_date = params[:end_date] || Time.new.strftime('%Y-%m-%d')

    @button_set = [[enterprise_accounting_and_finance_vendors_report_create_vendor_wizard_index_path,'CREATE VENDORS WIZARD'],
                   [enterprise_accounting_and_finance_vendors_report_vendors_path,'VENDORS']]

  end

end
