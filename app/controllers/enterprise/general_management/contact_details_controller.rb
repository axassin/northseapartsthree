class Enterprise::GeneralManagement::ContactDetailsController < GenericResourceController

  def setup_controller
    setup_variables( ContactDetail,
                     'Contact Details',
                     'Communication Assets',
                     ['contactable_id','contactable_type'],
                     [],
                     @@routes.enterprise_general_management_path,
                     @@routes.enterprise_general_management_contact_details_contact_wizard_index_path)
  end

  def process_form(my_contact_details, current_params, wizard_mode = nil)

    contact_detail_processing = Proc.new do
      my_contact_details.label = current_params[:label]
      polymorphic_reference_process(my_contact_details,'contactable',current_params)
      my_contact_details.save!
    end

    setup_process(my_contact_details, contact_detail_processing, wizard_mode)

  end

  def contactable
    picture_url = Enterprise::SystemAccount.find_by_id(Enterprise::GeneralManagement::ContactDetail
                                               .find_by_id(params[:id])
                                               .system_account_id).primary_image.url
    render text: picture_url.to_s
  end

end
