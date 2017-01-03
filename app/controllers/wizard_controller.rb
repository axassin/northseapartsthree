class WizardController < ApplicationController

  layout 'wizard/main'
  before_action :setup_wizard_controller

  def setup_variables(parent_path, current_path)
    @wizard_steps = wizard_steps
    @parent_path = parent_path
    @current_path = current_path
    @mother_parameters = Hash.new
    @current_resource_id = 'new'
    @restart = false

  end

  def setup_step(class_model = nil, skippable = false, repeatable = false)
    @skippable = skippable
    @form = class_model.form_path if class_model
    @current_instance = class_model.new if class_model
    @class_model = class_model
    @repeatable = repeatable


    # Check if Mother Model Exists
    if params.has_key?('mother_model_id') && params.has_key?('mother_model_type')
      puts 'has_key? = ' + ( params.has_key?('mother_model_id') && params.has_key?('mother_model_type') ).to_s
      puts 'exists? = ' + params[:mother_model_type].constantize.exists?(id: params[:mother_model_id]).to_s
      if params[:mother_model_type].constantize.exists?(id: params[:mother_model_id])
        @mother_model = params['mother_model_type'].constantize.find_by_id(params['mother_model_id'])
      else
        flash[:main_notification] = ' There was an error processing your request. Wizard has restarted. '
        @restart = true
      end
    end
  end

  def show_finish
    @restart == true ? (redirect_to @current_path + '/start') : (render_step(params[:id]))
  end

  def process_step(current_model, mother_model = false, finish_step = false)
    # Process request through respective Resource Controller
    unless finish_step
      model_id = current_model.associated_controller.new.process_form(current_model.new,
                                                                      params[current_model.associated_params],
                                                                      true)
    end

    # Put as Marker
    if mother_model
      @mother_parameters.store('mother_model_type',current_model.to_s)
      @mother_parameters.store('mother_model_id',model_id)
    else
      @mother_parameters.store('mother_model_type',params[:mother_model_type])
      @mother_parameters.store('mother_model_id',params[:mother_model_id])
    end

  end

  def update_finish
    main_step = nil
    params.has_key?('repeatable') ? main_step = step.to_s : main_step = next_step.to_s
    redirect_to @current_path + '/' + main_step + '?' + @mother_parameters.to_query
  end

end
