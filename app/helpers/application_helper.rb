module ApplicationHelper
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
