class WizardController < ApplicationController

  layout 'wizard/main'
  before_action :setup_wizard_controller

  def setup_variables(parent_path, current_path)
    @wizard_steps = wizard_steps
    @parent_path = parent_path
    @current_path = current_path
    @passable_parameters = Hash.new
  end

  def setup_step(skippable = false, class_model = nil)
    @skippable = skippable
    @form = class_model.form_path if class_model
    @current_instance = class_model.new if class_model
  end

  def process_step( current_model, hash_key)
    model_id = current_model.associated_controller.new.process_form(current_model.new,
                                                                    params[current_model.associated_params],
                                                                    true)
    @passable_parameters.store(hash_key,model_id)
  end

end
