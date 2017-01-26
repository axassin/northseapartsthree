class Enterprise::GeneralManagement::SystemConstantsController < GenericResourceController

  def setup_controller
    setup_variables( SystemConstant,
                     'System Constants',
                     'Constants for Application Use',
                     [],
                     [],
                     @@routes.enterprise_general_management_path)
  end

  def process_form(my_system_constant, current_params, wizard_mode = nil)

    system_constant_processing = Proc.new do
      my_system_constant.label = current_params[:label]
      my_system_constant.category_type = current_params[:category_type]
      my_system_constant.value = current_params[:value]
      my_system_constant.save!
    end

    setup_process(my_system_constant, system_constant_processing, wizard_mode)
  end

end
