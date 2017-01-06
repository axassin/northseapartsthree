module GenericResourceCommon
  extend ActiveSupport::Concern

  included do
    before_create {
      self.id = UUIDTools::UUID.timestamp_create().to_s.downcase if id.blank?
    }

    searchable do
      string :id
      text :id

      time :created_at
      time :updated_at
    end

  end

  module ClassMethods

    def searchable_string(attribute)
      searchable do
        string attribute
        text attribute
      end
    end

    def setup_model(resource_glyphicon)
      self.class_variable_set(:@@resource_glyphicon, resource_glyphicon)
    end

    def view_path
      self.to_s.pluralize.underscore.gsub('::','/')
    end

    def form_path
      view_path + '/form'
    end

    def cell_path
      view_path + '/cell'
    end

    def main_resource_path
      self.to_s.pluralize.underscore.downcase.gsub('::','/')
    end

    def associated_controller
      (self.to_s.pluralize + 'Controller').constantize
    end

    def associated_params
      self.to_s.gsub('::','_').underscore.downcase.to_sym
    end

    def parameterized
      self.to_s.underscore
    end

  end

end