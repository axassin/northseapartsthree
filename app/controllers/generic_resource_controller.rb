class GenericResourceController < ApplicationController

  before_action :setup_controller

  def setup_variables( class_model,
                       resource_title_heading,
                       resource_sub_heading,
                       omitted_attributes,
                       admitted_attributes,
                       parent_controller_path )

    @class_model = class_model
    @resource_glyphicon = class_model.class_variable_get(:@@resource_glyphicon)
    @resource_title_heading = resource_title_heading
    @resource_sub_heading = resource_sub_heading
    @omitted_attributes = omitted_attributes.push('deleted_at')
    @admitted_attributes = admitted_attributes
    @parent_controller_path = parent_controller_path
    @main_resource_path = class_model.class_variable_get(:@@resource_path)
    @current_instance = class_model.new
    @class_model_symbolized = class_model.to_s.underscore.gsub('/','_').to_sym

    puts '------------ VARIABLES INITIALIZED ---------------- '
    puts '@class_model: ' + @class_model.to_s
    puts '@resource_glyphicon: ' + @resource_glyphicon.to_s
    puts '@resource_title_heading: ' + @resource_title_heading.to_s
    puts '@resource_sub_heading: ' + @resource_sub_heading.to_s
    puts '@omitted_attributes: ' + @omitted_attributes.to_s
    puts '@admitted_attributes: ' + @admitted_attributes.to_s
    puts '@parent_controller_path: ' + @parent_controller_path.to_s
    puts '@main_resource_path: ' + @main_resource_path.to_s
    puts '@current_instance: ' + @current_instance.to_s
    puts '@class_model_symbolized: ' + @class_model_symbolized.to_s
    puts '--------------------------------------------------- '

  end

  def setup_index

    # Constants
    default_start_page = 1
    @DEFAULT_ITEMS_PER_PAGE = 10
    page = params[:page]
    per_page = params[:per_page]
    search_query = params[:search_query]

    # Defaults
    page ||= default_start_page
    per_page ||= @DEFAULT_ITEMS_PER_PAGE
    sort_by = params[:sort_by] || 'updated_at'
    order_by = params[:order_by] || 'desc'
    view_mode = params[:view_mode] || 'grid'

    # Sunspot Search
    search_results = @class_model.search do
      fulltext search_query
      paginate :page => page, :per_page => per_page
      order_by sort_by.to_sym , order_by.to_sym
    end

    # Output Variables
    @total = search_results.total
    @result_set = search_results.results
    @resource_glyphicon = @resource_glyphicon
    @resource_title_heading = @resource_title_heading
    @resource_sub_heading = @resource_sub_heading
    @omitted_attributes = @omitted_attributes.push('deleted_at')
    @admitted_attributes = @admitted_attributes
    @sort_by = sort_by
    @order_by = order_by
    @view_mode = view_mode
    @main_resource_path = @main_resource_path
    @current_instance = @class_model.new

    render template: 'layouts/generic_resource/main', layout: false

  end

  def setup_form

    @resource_glyphicon = @resource_glyphicon
    @resource_title_heading = @resource_title_heading
    @resource_sub_heading = @resource_sub_heading
    @main_resource_path = @main_resource_path

    if params.has_key?(:id)
      @current_instance = @class_model.find(params[:id])
    else
      @current_instance = @class_model.new
    end

    render template: 'layouts/generic_resource/main', layout: false

  end

  def image_handling(model_image, params_image)
    unless action_name == 'update' && params_image.blank? == true
      model_image = params_image
    end
  end

  def search_suggestion

    # Constants
    search_query = params[:search_query]

    # Sunspot Search
    search_suggestions = @class_model.search do
      fulltext search_query
    end

    # Push searched models into a suggestions array
    search_suggestions_array = []
    search_suggestions.results.each do |result|

      result.attribute_names.each do |attribute|
        suggestion = result.send(attribute)
        search_suggestions_array.push(suggestion) if suggestion.to_s.downcase.include? search_query.downcase
      end

      if @admitted_attributes.present?
        @admitted_attributes.each do |attribute|
          suggestion = result.send(attribute)
          search_suggestions_array.push(suggestion) if suggestion.to_s.downcase.include? search_query.downcase
        end
      end

    end

    # Respond
    respond_to do |format|
      format.json { render :json => search_suggestions_array.uniq }
    end

  end

  def index
    setup_index
  end

  def setup_process( process_block, wizard_mode = nil )

    modal_message = "There was a problem with the operation you've requested. Please contact Network Administrator."
    @saved_id = nil

    begin
      ActiveRecord::Base.transaction do
        process_block.call
        modal_message = 'Successful Operation! '
      end
    rescue => ex
      puts ' --------- PROCESS ERROR START --------- '
      puts ex
      puts ' ---------- PROCESS ERROR END ---------- '
    end

    wizard_mode ? (@saved_id) : (redirect_to @main_resource_path, :flash => { :main_notification => modal_message })

  end

  def new
    setup_form
  end

  def show
    setup_form
  end

  def edit
    setup_form
  end

  def destroy

    modal_message = 'Deleted'

    begin
      ActiveRecord::Base.transaction do
        @class_model.find(params[:id]).destroy
      end
    rescue => ex
      puts ex
    end
    redirect_to @main_resource_path, :flash => { :notice =>  modal_message}

  end

  def create
    process_form(@class_model.new, params[@class_model_symbolized])
  end

  def update
    process_form(@class_model.find(params[:id]), params[@class_model_symbolized])
  end

  def uniqueness_validation
    puts @class_model
    puts params[:attribute]
    puts params[:value]
    puts @class_model.exists?(params[:attribute].to_sym => params[:value])

    if @class_model.exists?(params[:attribute].to_sym => params[:value])
      head 400
    else
      head :ok
    end
  end

  def retrieve_resource
    render json: @class_model.find(params[:model_id])
  end

  def update_primary_image(instance_primary_image, current_params, wizard_mode = nil)
    puts '---------------- UPDATING ONE ----------------'
    if (action_name == 'update' || action_name == 'create') && (current_params.has_key?(:primary_image) == true)
      puts '---------------- UPDATING TWO ----------------'
      instance_primary_image.primary_image = current_params[:primary_image]
    end

    (instance_primary_image.primary_image = current_params[:primary_image]) if wizard_mode

  end

end
