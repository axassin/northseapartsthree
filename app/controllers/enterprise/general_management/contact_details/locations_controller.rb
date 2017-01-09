class Enterprise::GeneralManagement::ContactDetails::LocationsController < GenericResourceController

  def setup_controller
    setup_variables( Location,
                     'Location',
                     'Communication Assets',
                     ['contact_detail_id'],
                     ['label','owner'],
                     @@routes.enterprise_general_management_contact_details_path)
  end

  def process_form(my_location, current_params, wizard_mode = nil)

    location_processing = Proc.new do
      my_location.longitude = current_params[:longitude]
      my_location.latitude = current_params[:latitude]
      my_location.address = current_params[:address]
      my_location.contact_detail_id = current_params[:contact_detail_id]
      my_location.save!
    end

    setup_process(my_location, location_processing, wizard_mode)
  end



end
