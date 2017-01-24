class Enterprise::AssociatedImagesController < GenericResourceController

  def setup_controller
    setup_variables( AssociatedImage,
                     'Associated Image',
                     'Image Assets',
                     ['image','imageable_id','imageable_type'],
                     ['file_link','related'],
                     @@routes.enterprise_associated_files_path)
  end

  def process_form(my_associated_image, current_params, wizard_mode = nil)

    associated_image_processing = Proc.new do
      my_associated_image.name = current_params[:name]
      my_associated_image.description = current_params[:description]
      update_associated_file(my_associated_image, current_params, wizard_mode)
      polymorphic_reference_process(my_associated_image,'imageable',current_params)
      my_associated_image.save!
    end

    setup_process(my_associated_image, associated_image_processing, wizard_mode)

  end

end
