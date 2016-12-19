module FormHelper

  def validation_modifiers(hash, name, unique)
    name = name.to_s
    if (unique == true) && ((action_name == 'add') || (action_name == 'index'))
      hash.store('data-parsley-remote', @main_resource_path + '/uniqueness_validation?attribute='+name+'&value={value}')
    end
    hash
  end

  def input_word(f, name, unique = false)
    data_parsley_hash = { 'data-parsley-trigger': 'keyup',
                          'data-parsley-minlength': 3,
                          'data-parsley-maxlength': 64,
                          'data-parsley-validation-threshold': 0 }
    f.input name, input_html: validation_modifiers(data_parsley_hash, name, unique)
  end

  def input_sentence(f, name)
    f.input name, input_html: { 'data-parsley-trigger': 'keyup',
                                'data-parsley-minlength': 3,
                                'data-parsley-maxlength': 256,
                                'data-parsley-validation-threshold': 0 }
  end

  def input_description(f, name, id = nil)
    f.input name, as: :text, input_html: { 'data-parsley-trigger': 'keyup',
                                           'data-parsley-minlength': 3,
                                           'data-parsley-maxlength': 512,
                                           'data-parsley-validation-threshold': 0,
                                            id: id}
  end

  def input_long_decimal(f, name, id = nil)
    f.input name, as: :float, input_html: { 'data-parsley-trigger': 'keyup',
                                           'data-parsley-minlength': 3,
                                           'data-parsley-maxlength': 512,
                                           'data-parsley-validation-threshold': 0,
                                            id: id}
  end

  def input_date(f, name)
    f.input name, as: :date, html5: true
  end

  def selector(f, name, collection, selected)

    prompt_text_label = totally_humanize(name)

    f.input name,
            collection: collection,
            prompt: 'Select ' + prompt_text_label,
            selected: selected,
            required: true

  end

  def model_selector(f,model,name,selected, displayable_attributes = nil , primary_image = false, label_method = nil, value_method = 'id')

    current_id = 'new' if (selected == nil || selected == '')
    input_element_id = name.to_s + '_' +  current_id.to_s
    humanized_name = 'Select ' + totally_humanize(name)

    input_element = f.input name,
                            collection: model.all,
                            input_html: { id: input_element_id, class: name.to_s + '_select'},
                            prompt: 'Select ' + humanized_name,
                            selected: selected,
                            label: false,
                            required: true,
                            label_method: label_method.to_sym,
                            value_method: value_method.to_sym

    hidden_model_path = f.input :model_path,
                                :as => :hidden,
                                :input_html => { :value => model.main_resource_path, class: 'model_path' }

    collective_elements = mab do
      div :class => name.to_s + '_collective model_select_group' do

        label :class => 'outside_label string required', :for => input_element_id do
          humanized_name.upcase + ' *'
        end

        text! input_element.to_s
        text! hidden_model_path.to_s

        img :class => 'selector_primary_image' if primary_image == true

        if displayable_attributes != nil
          div :class => 'attribute_display' do
            displayable_attributes.each do |attribute|
              div do
                span do
                  totally_humanize(attribute)
                end
                span :class => 'displayable_attribute current_model_' + attribute do
                end
              end
            end
          end
        end

        a :class => 'btn btn-default add_model_select', :href => '/' + model.main_resource_path + '/new' do
          'Add New ' + totally_humanize(name)
        end

      end
    end

    collective_elements.html_safe

  end

  def contactable_selector(f, selected)

    input_element = f.input :contact_detail_id,
                            collection: Enterprise::GeneralManagement::ContactDetail.all,
                            label_method: :labeled_account,
                            value_method: :id,
                            prompt: 'Select System Account',
                            selected: selected,
                            input_html: { class: 'contactable_selector_select contactable_element', id: 'contactable'},
                            label: false,
                            required: true

    main_element = mab do
      div :class => 'contactable_selector' do

        label :class => 'outside_label string required contactable_element', :for => 'contactable' do
          'Owner | Contact Detail Set *'.upcase
        end

        text! input_element.to_s

        img :class => 'contactable_element'

        a :class => 'btn btn-default add-contactable-button', :href => new_enterprise_system_account_path do
          'Add New System Account'
        end

        a :class => 'btn btn-default add-contactable-button', :href => new_enterprise_general_management_contact_detail_path do
          'Add New Contact Detail'
        end

      end
    end

    main_element.html_safe
  end

  def primary_image_file_upload_element(f, params, current_instance)

    primary_image_input = f.input :primary_image, as: :file
    main = primary_image_input + primary_image_default(current_instance)
    main

  end

end