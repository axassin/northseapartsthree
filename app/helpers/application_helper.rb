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

  def enterprise_menu_cell(icon, path, text, sub_dir = nil)
    render partial: 'shared/topside_navigation/enterprise_menu_cell', locals: {
        icon: icon,
        text: text,
        path: path,
        sub_dir: sub_dir
    }
  end

  def enterprise_menu_cell_model(model)
    enterprise_menu_cell(model.glyphicon, model.view_path, model.humanized.pluralize)
  end

  def render_if_exists(path_to_partial)
    render path_to_partial if lookup_context.find_all(path_to_partial,[],true).any?
  end

end
