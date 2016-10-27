module GenericResource
  extend ActiveSupport::Concern

  def setup_table( class_model,
                   resource_glyphicon,
                   resource_title_heading,
                   resource_sub_heading,
                   omitted_attributes,
                   page,
                   per_page,
                   search_query )

    # Constants
    default_start_page = 1
    @DEFAULT_ITEMS_PER_PAGE = 10

    # Defaults
    page ||= default_start_page
    per_page ||= @DEFAULT_ITEMS_PER_PAGE

    # Sunspot Search
    search_results = class_model.search do
      fulltext search_query
      paginate :page => page, :per_page => per_page
    end

    # Output Variables
    @result_set = search_results.results
    @resource_glyphicon = resource_glyphicon
    @resource_title_heading = resource_title_heading || (controller_name).humanize
    @resource_sub_heading = resource_sub_heading
    @omitted_attributes = omitted_attributes || []
  end

  def setup_search_suggestions(class_model, search_query)

    # Sunspot Search
    search_suggestions = class_model.search do
      fulltext search_query
    end

    search_suggestions_array = []
    search_suggestions.results.each do |result|
      result.attribute_names.each do |attribute|
        suggestion = result.send(attribute)
        if suggestion.to_s.include? search_query
          search_suggestions_array.push(suggestion)
        end
      end
    end

    respond_to do |format|
      format.json { render :json => search_suggestions_array }
    end

  end

end