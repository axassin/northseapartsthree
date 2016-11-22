module ApplicationHelper

  require 'mab/kernel_method'

  def output_html_structure(html_structure)
    html_structure.to_s.html_safe
  end

  def asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end

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

  def primary_image_default(result, fa_glyphicon_code)

    str = mab do
      if ( result.primary_image.url.present? && public_file_exists?(result.primary_image.url) )
        img :src => result.primary_image.url, :style => 'width: 100%; height: 15%'
      else
        div :class => 'fa ' + fa_glyphicon_code + ' resource_glyphicon', :style => 'width: 100%', :align => 'center'
        br
      end
    end
    output_html_structure(str)
  end

  def rest_action?
    action_name == 'new' || action_name == 'edit' || action_name == 'show'
  end

  def asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end

  def public_file_exists?(path)
    current_path = Rails.root.to_s + '/public' + path
    File.exists?(current_path)
  end

end
