class Enterprise::AccountingAndFinance::VendorsReport::NewVendorFormController < FormController

  def index
    @vendor = Vendor.new

  end

  def process_form

  end

end
