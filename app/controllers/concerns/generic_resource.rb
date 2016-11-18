module GenericResource
  extend ActiveSupport::Concern

  include Rails.application.routes.url_helpers

  # setups variables needed for the controller
  def setup_resource_controller( class_model,
                                 resource_glyphicon,
                                 resource_title_heading,
                                 resource_sub_heading,
                                 main_resource_path,
                                 omitted_attributes,
                                 admitted_attributes)

    @@class_model = class_model
    @@resource_glyphicon = resource_glyphicon
    @@resource_title_heading = resource_title_heading
    @@resource_sub_heading = resource_sub_heading
    @@main_resource_path = main_resource_path
    @@omitted_attributes = omitted_attributes
    @@admitted_attributes = admitted_attributes

  end

  def setup_index(parent_controller_path)

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
    search_results = @@class_model.search do
      fulltext search_query
      paginate :page => page, :per_page => per_page
      order_by sort_by.to_sym , order_by.to_sym
    end

    # Output Variables
    @total = search_results.total
    @result_set = search_results.results
    @resource_glyphicon = @@resource_glyphicon
    @resource_title_heading = @@resource_title_heading
    @resource_sub_heading = @@resource_sub_heading
    @omitted_attributes = @@omitted_attributes.push('deleted_at')
    @admitted_attributes = @@admitted_attributes
    @sort_by = sort_by
    @order_by = order_by
    @view_mode = view_mode
    @parent_controller_path = parent_controller_path
    @main_resource_path = @@main_resource_path
    @current_instance = @@class_model.new

    render template: 'layouts/generic_resource/main', layout: false

  end

  def setup_search_suggestions

    # Constants
    search_query = params[:search_query]

    # Sunspot Search
    search_suggestions = @@class_model.search do
      fulltext search_query
    end

    # Push searched models into a suggestions array
    search_suggestions_array = []
    search_suggestions.results.each do |result|

      result.attribute_names.each do |attribute|
        suggestion = result.send(attribute)
        search_suggestions_array.push(suggestion) if suggestion.to_s.downcase.include? search_query.downcase
      end

      if @@admitted_attributes.present?
        @@admitted_attributes.each do |attribute|
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

  def setup_form

    @resource_glyphicon = @@resource_glyphicon
    @resource_title_heading = @@resource_title_heading
    @resource_sub_heading = @@resource_sub_heading
    @main_resource_path = @@main_resource_path

    if params.has_key?(:id)
      @current_instance = @@class_model.find(params[:id])
    else
      @current_instance = @@class_model.new
    end

    render template: 'layouts/generic_resource/main', layout: false

  end



  def setup_process( process_block )
    modal_message = "There was a problem with the operation you've requested. Please contact Network Administrator."
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
    redirect_to @@main_resource_path, :flash => { :notice => modal_message }
  end

  def image_handling(model_image, params_image)
    unless action_name == 'update' && params_image.blank? == true
      model_image = params_image
    end
  end

  def setup_delete
    modal_message = 'Deleted'
    begin
      ActiveRecord::Base.transaction do
        @@class_model.find(params[:id]).destroy
      end
    rescue => ex
      puts ex
    end
    redirect_to @@main_resource_path, :flash => { :notice =>  modal_message}
  end

end