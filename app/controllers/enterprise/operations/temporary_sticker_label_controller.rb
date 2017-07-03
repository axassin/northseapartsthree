class Enterprise::Operations::TemporaryStickerLabelController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_temporary_sticker_label_path,
                     @@routes.enterprise_operations_path, 'Temporary Sticker Label')
  end

  def index

  end

  def process_index

  end


end
