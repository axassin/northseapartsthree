class Enterprise::GeneralManagement::ContactDetailsController < ApplicationController

  def setup_controller
    setup_variables( ContactDetail,
                     'fa-address-card-o',
                     'Contact Details',
                     'Communication Assets',
                     [],
                     [],
                     @@routes.enterprise_general_management_path,
                     @@routes.enterprise_general_management_contact_details_path )
  end

  def index
    setup_index
  end

  def contactable
    picture_url = SystemAccount.find_by_id(ContactDetail.find_by_id(params[:id]).system_account_id).primary_image.url
    render text: picture_url
  end

end
