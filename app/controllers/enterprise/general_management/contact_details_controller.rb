class Enterprise::GeneralManagement::ContactDetailsController < GenericResourceController

  def setup_controller
    setup_variables( ContactDetail,
                     'Contact Details',
                     'Communication Assets',
                     [],
                     [],
                     @@routes.enterprise_general_management_path,
                     @@routes.enterprise_general_management_contact_details_path )
  end

  def process_form(my_contact_details, current_params, wizard_mode = nil)

    contact_detail_processing = Proc.new do
      my_contact_details.label = current_params[:label]
      contactable_array = current_params[:contactable].to_s.split(",")

      puts '--------------------- - - - -- ------'
      puts contactable_array
      puts '--------------------- - - - -- ------'

      my_contact_details.contactable_type = contactable_array[0]
      my_contact_details.contactable_id = contactable_array[1]
      my_contact_details.save!
      @saved_id = my_contact_details.id
    end

    setup_process(contact_detail_processing, wizard_mode)

  end

  def contactable
    picture_url = Enterprise::SystemAccount.find_by_id(Enterprise::GeneralManagement::ContactDetail
                                               .find_by_id(params[:id])
                                               .system_account_id).primary_image.url
    render text: picture_url.to_s
  end

end
