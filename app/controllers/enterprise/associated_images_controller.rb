class Enterprise::AssociatedImagesController < ApplicationController

  def setup_controller
    setup_variables( AssociatedImage,
                     'Associated Image',
                     'Image Assets',
                     ['image','imageable_id','imageable_type'],
                     ['file_link','related'],
                     @@routes.enterprise_associated_files_path)
  end

  def process_form(my_associated_file, current_params, wizard_mode = nil)

    associated_file_processing = Proc.new do
      my_associated_file.name = current_params[:name]
      my_associated_file.description = current_params[:description]
      update_associated_file(my_associated_file, current_params, wizard_mode)
      polymorphic_reference_process(my_associated_file,'fileable',current_params)
      my_associated_file.save!
    end

    setup_process(my_associated_file, associated_file_processing, wizard_mode)

  end

end
