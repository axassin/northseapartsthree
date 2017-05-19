class Enterprise::Operations::TemporaryLabelStickerController < GenericGeneratorController
  def setup_controller
  	setup_variables( @@routes.enterprise_operations_temporary_label_sticker_path,
                     @@routes.enterprise_operations_path, 'Temporary Label Sticker')
  end

  def index
  end
 end