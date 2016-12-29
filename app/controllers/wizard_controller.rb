class WizardController < ApplicationController

  layout 'wizard/main'
  before_action :setup_wizard_controller

  def setup_variables(parent_path, current_path)
    @wizard_steps = wizard_steps
    @parent_path = parent_path
    @current_path = current_path
    @parameters = nil
  end

  def setup_step(skippable = false, class_model = nil)
    @skippable = skippable
    @form = class_model.form_path if class_model
    @current_instance = class_model.new if class_model
  end

  def parameter_add(key, value)

  end

end
