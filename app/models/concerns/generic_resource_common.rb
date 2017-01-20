module GenericResourceCommon
  extend ActiveSupport::Concern

  include Rails.application.routes.url_helpers
  @@routes = Rails.application.routes.url_helpers

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

  def represent
    self.send(self.class.class_variable_get(:@@representative_attribute))
  end

  def show_path
    resource_path = self.class.class_variable_get(:@@resource_path)
    resource_path + '/' + self.id
  end

  module ClassMethods

    def searchable_string(attribute)
      searchable do
        string attribute
        text attribute
      end
    end

    def searchable_date(attribute)
      searchable do
        time attribute
        string attribute
      end
    end

    def setup_model(resource_glyphicon, representative_attribute, resource_path, associated_controller, polymorphic_attribute = nil)
      self.class_variable_set(:@@resource_glyphicon, resource_glyphicon)
      self.class_variable_set(:@@representative_attribute, representative_attribute)
      self.class_variable_set(:@@resource_path, resource_path)
      self.class_variable_set(:@@associated_controller, associated_controller)
      self.class_variable_set(:@@polymorphic_attribute, polymorphic_attribute)
    end

    def view_path
      self.class_variable_get(:@@resource_path)
    end

    def form_path
      view_path + '/form'
    end

    def cell_path
      view_path + '/cell'
    end

    def main_resource_path
      self.class_variable_get(:@@resource_path)
    end

    def associated_controller
      self.class_variable_get(:@@associated_controller)
    end

    def associated_params
      self.to_s.gsub('::','_').underscore.downcase.to_sym
    end

    def parameterized
      self.to_s.underscore
    end

    def polymorphic_attribute
      self.class_variable_get(:@@associated_controller)
    end

  end

end