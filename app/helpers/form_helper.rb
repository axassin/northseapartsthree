module FormHelper

  def custom_validator_hash(hash, custom_validator)
    if custom_validator != nil
      hash.store('data-parsley-remote',custom_validator)
    end
    hash
  end

  def input_word(f, name, custom_validator = nil)
    data_parsley_hash = { 'data-parsley-trigger': 'keyup',
                          'data-parsley-minlength': 3,
                          'data-parsley-maxlength': 64,
                          'data-parsley-validation-threshold': 0 }
    f.input name, input_html: custom_validator_hash(data_parsley_hash, custom_validator)
  end

  def input_sentence(f, name)
    f.input name, input_html: { 'data-parsley-trigger': 'keyup',
                                'data-parsley-minlength': 3,
                                'data-parsley-maxlength': 256,
                                'data-parsley-validation-threshold': 0 }
  end

  def input_description(f, name)
    f.input name, as: :text, input_html: { 'data-parsley-trigger': 'keyup',
                                           'data-parsley-minlength': 3,
                                           'data-parsley-maxlength': 512,
                                           'data-parsley-validation-threshold': 0 }
  end

  def input_date(f, name)
    f.input name, as: :date, html5: true
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

      end
    end

    main_element.html_safe
  end

end