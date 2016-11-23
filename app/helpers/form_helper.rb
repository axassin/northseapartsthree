module FormHelper

  def input_word(f, name)
    f.input name, input_html: { 'data-parsley-trigger': 'keyup',
                                'data-parsley-minlength': 3,
                                'data-parsley-maxlength': 64,
                                'data-parsley-validation-threshold': 0 }
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

  def system_account_preview(id)
    str = mab do

    end
    output_html_structure(str)
  end

  def contactable_selector(f, selected)

    label_element = mab do
      label :class => 'outside_label string required', :for => 'contactable' do
        'Owner | Contact Detail Set *'.upcase
      end
    end

    input_element = f.input :contact_detail_id,
                            collection: ContactDetail.all,
                            label_method: :labeled_account,
                            value_method: :id,
                            prompt: 'Select System Account',
                            selected: selected,
                            input_html: { class: 'contactable_selector', id: 'contactable'},
                            label: false,
                            required: true

    image_element = mab do
      div :class => 'contactable_preview' do
        img :class => 'contactable_image'
      end
    end

    (label_element + input_element + image_element).html_safe
  end

end