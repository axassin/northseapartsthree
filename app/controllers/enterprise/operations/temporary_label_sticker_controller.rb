class Enterprise::Operations::TemporaryLabelStickerController < GenericGeneratorController
  def setup_controller
  	setup_variables( @@routes.enterprise_operations_temporary_label_sticker_path,
                     @@routes.enterprise_operations_path, 'Temporary Label Sticker')
  end

  def index
  	uploader = PrimaryImageUploader.new
	image = params[:image]  
	uploader.store!(image)
	@image = params[ :image ]
    uploader.retrieve_from_store!(image)
  end

 end