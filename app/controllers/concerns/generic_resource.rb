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

    @DEFAULT_ITEMS_PER_PAGE = 10

    page ||= 1
    per_page ||= @DEFAULT_ITEMS_PER_PAGE

    search_results = class_model.search do
      fulltext search_query
      paginate :page => page, :per_page => per_page
    end
    @result_set = search_results.results
    @resource_glyphicon = resource_glyphicon
    @resource_title_heading = resource_title_heading || (controller_name).humanize
    @resource_sub_heading = resource_sub_heading
    @omitted_attributes = omitted_attributes || []

  end

end