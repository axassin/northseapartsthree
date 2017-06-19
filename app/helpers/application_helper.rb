module ApplicationHelper

  require 'mab/kernel_method'

  def convert_interval_to_time_string(time_format_string = nil)
    time_format_string
    case @interval
      when 'day'
        time_format_string = '%m-%d-%Y'
      when 'week'
        time_format_string = '%m-%G-%Y'
      when 'month'
        time_format_string = '%B, %Y'
      when 'year'
        time_format_string = '%Y'
    end
    time_format_string
  end

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

  def asset_exists?(subdirectory, filename)
    File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
  end

  def image_exists?(image)
    asset_exists?('images', image)
  end

  def javascript_exists?(script)
    extensions = %w(.coffee .erb .coffee.erb) + [""]
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('javascripts', "#{script}#{extension}")
    end
  end

  def stylesheet_exists?(stylesheet)
    extensions = %w(.scss .erb .scss.erb .sass) + [""]
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('stylesheets', "#{stylesheet}#{extension}")
    end
  end

  def public_file_exists?(path)
    current_path = Rails.root.to_s + '/public' + path
    File.exists?(current_path)
  end

  def totally_humanize(target_string)
    target_string.to_s.humanize.split.map(&:capitalize)*' '
  end

  def camel_to_human(target_string)
    target_string.to_s.underscore.humanize.split.map(&:capitalize).join(' ')
  end

  def class_to_path(current_class)
    current_class.to_s.pluralize.underscore.gsub('::','/')
  end

  def class_to_human

  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def render_menu_array(enterprise_menu_array)

    output_html = content_tag :div, 'data-parent-category': 'enterprise' do
      'dfasdf'
    end

    enterprise_menu_array.each do |element|
      if element.class == Class

      elsif element.kind_of?(Array)

      end
    end
    output_html
  end

  def enterprise_menu_cell(icon, path, text, sub_dir = nil)

    main_element = mab do

      div :class => 'menu_cell', :'data-text-label' => text.to_s.humanize.downcase do

        i :class => 'fa fa-' + icon
        br
        a :class => 'cell_text', :href => path do
          text.to_s.humanize
        end
        br
        if sub_dir
          button :class => 'btn btn-default sub_menu_button', :unhide => text do
            i :class => 'fa fa-chevron-down'
          end
        end
      end
    end

    main_element.html_safe

  end

  def enterprise_menu_cell_model(model)
    enterprise_menu_cell(model.glyphicon, model.view_path, model.humanized.pluralize)
  end

  def render_if_exists(path_to_partial)
    render path_to_partial if lookup_context.find_all(path_to_partial,[],true).any?
  end

end
