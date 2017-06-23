# this module sets up a model as a resource. automatically sets up for controller, model and instance

module GenericResourceCommon extend ActiveSupport::Concern

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

    def goog_currency_php_converter(amount, amount_currency)
      result = 0
      formatted_amount_currency = amount_currency.downcase.to_s
      conversion_method = formatted_amount_currency + '_to_php'
      if conversion_method == 'php_to_php'
        result = amount.to_f
      else
        result = GoogCurrency.send(conversion_method, amount.to_f)
      end
      result
    end

    # defines a searchable string for solr
    def searchable_string(attribute)
      searchable do
        string attribute
        text attribute
      end
    end

    # defines a searchable date for solr
    def searchable_date(attribute)
      searchable do
        time attribute
        string attribute
      end
    end

    # setups the model's class variables
    def setup_model(resource_glyphicon, representative_attribute, resource_path, associated_controller, polymorphic_attribute = nil)

      # pick a font-awesome based glyphicon for model; see font-awesome
      self.class_variable_set(:@@resource_glyphicon, resource_glyphicon)

      # pick one method from model that will represent entire instance
      self.class_variable_set(:@@representative_attribute, representative_attribute)

      # declare path in routes
      self.class_variable_set(:@@resource_path, resource_path)

      # declare resource controller
      self.class_variable_set(:@@associated_controller, associated_controller)

      # declare a polymorphic method if there is one
      self.class_variable_set(:@@polymorphic_attribute, polymorphic_attribute)
    end

    def glyphicon
      self.class_variable_get(:@@resource_glyphicon)
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

    def self.main_resource_path
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

    def humanized
      self.to_s.titleize
    end

    def polymorphic_attribute
      self.class_variable_get(:@@associated_controller)
    end

  end

end