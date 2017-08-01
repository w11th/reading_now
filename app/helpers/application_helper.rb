module ApplicationHelper
  APP_NAME = 'Reading Now'.freeze

  def app_name
    APP_NAME
  end

  def full_title(page_title = '')
    if page_title.blank?
      app_name
    else
      "#{page_title} | #{app_name}"
    end
  end

  def menu_li_tag(path, text = '')
    content_tag(:li, request.path == path ? { class: 'active' } : {}) do
      content_tag(:a, href: path) do
        if block_given?
          yield
        else
          text
        end
      end
    end
  end

  def twitterlized_alert_type(type)
    case type
    when 'alert'
      'danger'
    when 'error'
      'danger'
    when 'notice'
      'info'
    else
      type.to_s
    end
  end
end
