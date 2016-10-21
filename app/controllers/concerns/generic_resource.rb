module GenericResource
  extend ActiveSupport::Concern

  def setup_table( class_model, resource_glyphicon, resource_title_heading, resource_sub_heading, omitted_attributes, page, items_per_page)

    page ||= 1
    items_per_page ||= 10

    @result_set = (class_model.all).page(page).per(items_per_page)
    @resource_glyphicon = resource_glyphicon
    @resource_title_heading = resource_title_heading || (controller_name).humanize
    @resource_sub_heading = resource_sub_heading
    @omitted_attributes = omitted_attributes || []

  end

end