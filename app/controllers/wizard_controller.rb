class WizardController < ApplicationController

  layout 'wizard/main'
  before_action :setup_controller
  before_action :authenticate_user!

  def setup_variables(parent_path, current_path)
    @wizard_steps = wizard_steps
    @parent_path = parent_path
    @main_resource_path = current_path
    @mother_parameters = Hash.new
    @current_resource_id = 'new'
    @restart = false
  end

  def setup_step(class_model = nil, skippable = false, repeatable = false, choice = false)
    @skippable = skippable
    @form = class_model.form_path if class_model
    @current_instance = class_model.new if class_model
    @class_model = class_model
    @repeatable = repeatable
    @choice = choice

    # check if mother models exist
    if params.has_key?('wizard_model_id') && params.has_key?('wizard_model_type')

      # delete if wizard - restart mode
      if params.has_key?('delete_mode')
        wizard_model_id = params[:wizard_model_id]
        wizard_model_type = params[:wizard_model_type]
        if wizard_model_id.present? && wizard_model_type.present?
          wizard_model_type.constantize.find_by_id(wizard_model_id).destroy
        end
        @restart = true
      end

      # otherwise continue evaluating
      if params[:wizard_model_type].constantize.exists?(id: params[:wizard_model_id])
        @wizard_model_instance = params['wizard_model_type'].constantize.find_by_id(params['wizard_model_id'])
      else
        flash[:main_notification] = ' Wizard has restarted. '
        @restart = true
      end

    end

  end

  def setup_associations(main_array)
    if @wizard_model_instance.present?
      main_array.insert(0,@wizard_model_instance)
    end
    @associated_instances = main_array
  end

  def show_finish
    @restart == true ? (redirect_to @main_resource_path + '/start') : (render_step(params[:id]))
  end

  def process_step(current_model, wizard_model = false, finish_step = false, next_step = nil)

    puts '------------ request went through ----------------- '

    # Process request through respective Resource Controller
    unless finish_step
      response = current_model.associated_controller.new.process_form(current_model.new,
                                                                      params[current_model.associated_params],
                                                                      true)
    end

    # Response Error Check
    @error_flag = false
    if response.class < StandardError
      @error_flag = true
      @error_message = response
    else

      # Put as Mother Model
      if wizard_model
        @mother_parameters.store('wizard_model_type',current_model.to_s)
        @mother_parameters.store('wizard_model_id',response)
      else
        @mother_parameters.store('wizard_model_type',params[:wizard_model_type])
        @mother_parameters.store('wizard_model_id',params[:wizard_model_id])
      end

      @next_step = next_step unless next_step.nil?

    end



  end

  def update_finish

    # check for errors
    if @error_flag
      flash[:main_notification] = ' There was an error processing your request. Wizard has restarted: ' + @error_message.to_s
      update_redirection_path = @main_resource_path # if there is one, go back to the start of wizard
    else

      # for repeating steps
      params.has_key?('repeatable') ? main_step = step.to_s : main_step = next_step.to_s

      # redirect path finalization
      update_redirection_path = @main_resource_path + '/' + main_step.to_s + '?' + @mother_parameters.to_query
    end
    redirect_to update_redirection_path

  end

end
