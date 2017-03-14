class Enterprise::GeneralManagement::ContactDetails::TelephoneNumbersController < GenericResourceController

  def setup_controller
    setup_variables( TelephoneNumber,
                     'Telephone Numbers',
                     'Communication Assets',
                     ['contact_detail_id'],
                     ['label','owner'],
                     @@routes.enterprise_general_management_contact_details_path)
  end

  def process_form(my_telephone, current_params, wizard_mode = nil)

    telephone_processing = Proc.new do
      my_telephone.digits = current_params[:digits]
      my_telephone.remark = current_params[:remark]
      my_telephone.contact_detail_id = current_params[:contact_detail_id]
      my_telephone.save!
    end

    setup_process(my_telephone, telephone_processing, wizard_mode)
  end

end