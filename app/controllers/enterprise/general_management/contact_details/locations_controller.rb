class Enterprise::GeneralManagement::ContactDetails::LocationsController < GenericResourceController

  def setup_controller
    setup_variables( Enterprise::GeneralManagement::ContactDetails::Location,
                     'fa fa-map-marker',
                     'Location',
                     'Communication Assets',
                     ['contact_detail_id'],
                     ['label','owner'],
                     @@routes.enterprise_general_management_contact_details_path,
                     @@routes.enterprise_general_management_contact_details_locations_path )
  end

  def process_form(my_location, current_params)

    location_processing = Proc.new do
      my_location.longitude = current_params[:longitude]
      my_location.latitude = current_params[:latitude]
      my_location.address = current_params[:address]
      my_location.contact_detail_id = current_params[:contact_detail_id]
      my_location.save!
    end

    setup_process(location_processing)
  end



end
