module GenericResource
  extend ActiveSupport::Concern

  def setup_table( omitted_attributes = nil )

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
    view_mode = params[:view_mode] || 'icon'

    # Sunspot Search
    search_results = @@class_model.search do
      fulltext search_query
      paginate :page => page, :per_page => per_page
      order_by sort_by.to_sym , order_by.to_sym
    end

    # Output Variables
    @result_set = search_results.results
    @resource_glyphicon = @@resource_glyphicon
    @resource_title_heading = @@resource_title_heading
    @resource_sub_heading = @@resource_sub_heading
    @omitted_attributes = omitted_attributes || []
    @sort_by = sort_by
    @order_by = order_by
    @view_mode = view_mode

    render template: 'layouts/generic_resource/index', layout: false

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

    if params.has_key?(:id)

    else
      @current_instance = @@class_model.new
    end

    render template: 'layouts/generic_resource/form', layout: false
  end

  def setup_resource_controller( class_model,
                                 resource_glyphicon,
                                 resource_title_heading,
                                 resource_sub_heading,
                                 main_resource_path)

    @@class_model = class_model
    @@resource_glyphicon = resource_glyphicon
    @@resource_title_heading = resource_title_heading
    @@resource_sub_heading = resource_sub_heading
    @@main_resource_path = main_resource_path

  end

end