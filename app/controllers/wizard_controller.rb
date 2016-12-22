class WizardController < ApplicationController

  layout 'wizard'
  before_action :setup_wizard_controller

  def setup_variables(parent_path)
    @wizard_steps = wizard_steps
    @parent_path = parent_path
  end

  def setup_step(skippable = false, form = false, class_model)
    @skippable = skippable
    @form = form
    @current_instance = class_model.new if class_model
  end

end
