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
    object.class.reflect_on_all_associations(:belongs_to).each do |association|

      owning_class = association.klass
      foreign_key_name = association.foreign_key
      foreign_key_value = object.send(foreign_key_name)
      owning_object = owning_class.find(foreign_key_value)
      owning_object_link = owning_object.show_path
      owning_object_representation = owning_object.represent

      current_element = mab do
        a :class => 'btn btn-default', :href => owning_object_link, :target => '_new' do
          owning_object_representation
        end
      end

      main_element << current_element
    end

    main_element.html_safe
  end

  def associated
    object.class.reflect_on_all_associations(:belongs_to).each do |association|
      puts '------------------------------------ -------'
      puts association.name
      puts 'go this '
    end
  end

end