class Enterprise::GeneralManagement::ContactDetails::TelephoneNumbersController < GenericResourceController

  def setup_controller
    setup_variables( Enterprise::GeneralManagement::ContactDetails::TelephoneNumber,
                     'Telephone Numbers',
                     'Communication Assets',
                     ['contact_detail_id'],
                     ['label','owner'],
                     @@routes.enterprise_general_management_contact_details_path,
                     @@routes.enterprise_general_management_contact_details_telephone_numbers_path )
  end

  def process_form(my_telephone, current_params)

    telephone_processing = Proc.new do
      my_telephone.digits = current_params[:digits]
      my_telephone.remark = current_params[:remark]
      my_telephone.contact_detail_id = current_params[:contact_detail_id]
      my_telephone.save!
    end

    setup_process(telephone_processing)
  end

end