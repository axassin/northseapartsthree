class Enterprise::AccountingAndFinance::VendorsReport::VendorsController < GenericResourceController

  def setup_controller
    setup_variables( Vendor,
                     'Vendors',
                     'Suppliers of Auxiliary Services or Supplies',
                     ['system_account_id'],
                     ['account_name'],
                     @@routes.enterprise_accounting_and_finance_vendors_report_path)
  end

  def process_form(my_vendor, current_params, wizard_mode = nil)

    vendor_processing = Proc.new do
      my_vendor.system_account_id = current_params[:system_account_id]
      vendor.save!
    end

    setup_process(my_vendor, vendor_processing, wizard_mode)
  end

end
