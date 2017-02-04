module FormHelper

  # support function for input_*
  def validation_modifiers(hash, name, unique)
    name = name.to_s
    if (unique == true) && ((action_name == 'add') || (action_name == 'index'))
      hash.store('data-parsley-remote', @main_resource_path + '/uniqueness_validation?attribute='+name+'&value={value}')
    end
    hash
  end

  # input type text with word default
  def input_word(f, name, unique = false)
    data_parsley_hash = { 'data-parsley-trigger': 'keyup',
                          'data-parsley-minlength': 3,
                          'data-parsley-maxlength': 64,
                          'data-parsley-validation-threshold': 0 }
    f.input name, input_html: validation_modifiers(data_parsley_hash, name, unique)
  end

  # input type text with sentence default
  def input_sentence(f, name)
    f.input name, input_html: { 'data-parsley-trigger': 'keyup',
                                'data-parsley-minlength': 3,
                                'data-parsley-maxlength': 256,
                                'data-parsley-validation-threshold': 0 }
  end

  # input type text with description default
  def input_description(f, name, id = nil)
    f.input name, as: :text, input_html: { 'data-parsley-trigger': 'keyup',
                                           'data-parsley-minlength': 3,
                                           'data-parsley-maxlength': 512,
                                           'data-parsley-validation-threshold': 0,
                                            id: id}
  end

  # input type float
  def input_long_decimal(f, name, id = nil)
    f.input name, as: :float, input_html: { 'data-parsley-trigger': 'keyup',
                                           'data-parsley-minlength': 3,
                                           'data-parsley-maxlength': 512,
                                           'data-parsley-validation-threshold': 0,
                                            id: id}
  end

  # date selector
  def input_date(f, name)
    f.input name, as: :date, html5: true
  end

  # simple Selector with explicit selection array
  def selector(f, name, collection, selected, required = true)

    prompt_text_label = totally_humanize(name)

    f.input name,
            collection: collection,
            prompt: 'Select ' + prompt_text_label,
            selected: selected,
            required: required

  end

  # primary image uploader element
  def image_upload_input(f, params, current_instance, name = 'primary_image', required = false)
    image_input = f.input name.to_sym, as: :file, required: required
    main = image_input + image_preview(current_instance, name)
    main
  end

  # file uploader element
  def associated_file_upload_element(f, params, current_instance, required = false)
    primary_image_input = f.input :file, as: :file, required: required
    main = primary_image_input + file_preview(current_instance)
    main
  end

  # Selector for a single model
  def model_selector(f, model, name, selected, label_method = nil, value_method = 'id', disabled = false)
    render partial: 'common/form/model_selector', locals: {
        f: f,
        model: model,
        name: name,
        selected: selected,
        label_method: label_method,
        value_method: value_method,
        disabled: disabled
    }
  end

  def html5_date_selector(f, model, name)
    render partial: 'common/form/date_selector', locals: {
        f: f,
        model: model,
        name: name
    }
  end

  def html5_time_selector(f, model, name)
    render partial: 'common/form/time_selector', locals: {
        f: f,
        model: model,
        name: name
    }
  end

  def html5_date_time_selector(f, model, name)
    render partial: 'common/form/date_time_selector', locals: {
        f: f,
        model: model,
        name: name
    }
  end

  # multiple model selector for polymorphic types - manual render partial due to complicated logic
  def polymorphic_selector(f, selected, polymorphic_name, polymorphic_hash, disabled = false)
    render partial: 'common/form/polymorphic_selector', locals: {
        f: f,
        selected: selected,
        polymorphic_name: polymorphic_name,
        polymorphic_hash: polymorphic_hash,
        disabled: disabled
    }
  end

  # Contact Detail Selector for Contact Articles; incorporates wizard functionality
  def contact_detail_selector(f, current_instance)
    render partial: 'common/form/contact_detail_selector', locals: {
        f: f,
        current_instance: current_instance
    }
  end

  def wizardable_contactable_selector(f, params, current_instance)
    main = contactable_selector(f, current_instance.contact_detail_id)
    if @wizard_steps
      hidden_element = mab do
        input :type => 'hidden',
              :name => @class_model.associated_params.to_s + '[contact_detail_id]',
              :value => @contact_detail_id
      end
      contactable_selector(f, @contact_detail_id, true) + hidden_element.html_safe
    else
      main
    end
  end



end