module GenericResource
  extend ActiveSupport::Concern

  def setup_table( class_model, resource_glyphicon, resource_title_heading, resource_sub_heading )

    @result_set = class_model.all
    @resource_glyphicon = resource_glyphicon
    @resource_title_heading = resource_title_heading || (controller_name).humanize
    @resource_sub_heading = resource_sub_heading

  end

end