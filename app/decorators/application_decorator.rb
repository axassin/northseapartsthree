class ApplicationDecorator < Drape::Decorator

  delegate_all
  @@routes = Rails.application

  include TimestampDecorator
  include IdentificationDecorator

  require 'mab/kernel_method'

  def output_html_structure(html_structure)
    html_structure.to_s.html_safe
  end

  def related

    main_element = ''
    mab_token = false
    object.class.reflect_on_all_associations(:belongs_to).each do |association|

      if association.options[:polymorphic] == false

        # Normal Belongs To
        owning_class = association.klass
        foreign_key_name = association.foreign_key
        foreign_key_value = object.send(foreign_key_name)
        owning_object = owning_class.find(foreign_key_value)
        owning_object_link = owning_object.show_path
        owning_object_representation = owning_object.represent
        mab_token = true

      elsif association.options[:polymorphic] == true

        # Polymorphic Belongs To
        polymorphic_key = association.name.to_s
        column_id = polymorphic_key + '_id'
        column_type = polymorphic_key + '_type'
        main_class = object.send(column_type).constantize
        polymorphic_key_id = object.send(column_id)
        owning_object = main_class.find(polymorphic_key_id)
        owning_object_link = owning_object.show_path
        owning_object_representation = owning_object.represent
        mab_token = true

      else

        mab_token = false

      end

      if mab_token
        current_element = mab do
          a :class => 'btn btn-default', :href => owning_object_link, :target => '_new' do
            owning_object_representation
          end
        end
      else
        current_element = 'N/A'
      end

      main_element << current_element
    end

    main_element.html_safe
  end

end