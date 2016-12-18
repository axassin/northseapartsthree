class Enterprise::GeneralManagement::ContactDetailsController < GenericResourceController

  def setup_controller
    setup_variables( Enterprise::GeneralManagement::ContactDetail,
                     'fa fa-book',
                     'Contact Details',
                     'Communication Assets',
                     [],
                     [],
                     @@routes.enterprise_general_management_path,
                     @@routes.enterprise_general_management_contact_details_path )
  end

  def process_form(my_contact_details, current_params)

    contact_detail_processing = Proc.new do
      my_contact_details.label = current_params[:label]
      my_contact_details.system_account_id = current_params[:system_account_id]
      my_contact_details.save!
    end

    setup_process(contact_detail_processing)

  end

  def contactable
    picture_url = Enterprise::SystemAccount.find_by_id(Enterprise::GeneralManagement::ContactDetail
                                               .find_by_id(params[:id])
                                               .system_account_id).primary_image.url
    render text: picture_url.to_s
  end

end
