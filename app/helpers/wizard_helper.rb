module WizardHelper

  def associated_wizard_section(model_instance)
    main_str = ''
    if model_instance.present?

      if model_instance.class < ActiveRecord::Associations::CollectionProxy

        main_str = mab do
          span :class => 'stackable_column' do

            model_instance.each do |instance|

              show_path = instance.show_path
              represent = instance.represent

              a :class => 'btn btn-default associated_wizard_button', :href => show_path, :target => '_new' do
                represent
              end

            end

          end
        end

      else

        show_path = model_instance.show_path
        represent = model_instance.represent

        main_str = mab do
          span :class => 'stackable_column' do
            a :class => 'btn btn-default associated_wizard_button', :href => show_path, :target => '_new' do
              represent
            end
          end
        end

      end

    end
    main_str.html_safe
  end

end
