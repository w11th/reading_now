module OmniauthHelper
  def provider_button_tag(provider, scope = "user")
    content_tag(:a, href: send("#{scope}_#{provider}_omniauth_authorize_path"), class: "btn btn-provider-icon btn-provider-#{provider}") do
      concat content_tag(:span, '', class: "fa fa-#{provider}")
      concat content_tag(:span, "使用 #{provider} 登录", class: "sr-only")
    end
  end

  def provider_button_list_tag
    content_tag(:ul) do
      Connection::ALLOW_PROVIDERS.map do |provider|
        content_tag(:li) do
          provider_button_tag(provider)
        end
      end.join.html_safe
    end
  end

  def provider_display_name(provider)
    case provider
    when 'facebook' then 'Facebook'
    when 'github' then 'GitHub'
    when 'douban' then '豆瓣'
    when 'wechat' then '微信'
    else provider
    end
  end

  def provider_link_url(auth_data)
    case auth_data['provider']
    when 'facebook' then 'https://facebook.com'
    when 'github' then 'https://github.com'
    when 'douban' then 'https://douban.com'
    when 'wechat' then 'https://wx.qq.com'
    else provider
    end
  end

  def omniauth_data_tag(action = 'sign in')
    return unless omniauth_data
    content_tag(:div, class: 'omniauth-data-line') do
      content_tag(:div, class: 'checkbox') do
        content_tag(:label) do
          concat check_box_tag('auto_connect', '1', false)
          concat "#{action}后自动绑定 #{provider_display_name(omniauth_data['provider'])} 帐号："
          concat content_tag(:a, omniauth_data['info']&.[]('name'),
                             href: provider_link_url(omniauth_data),
                             target: '_blank')
          concat image_tag(omniauth_data['info']&.[]('image'),
                           class: 'img-circle',
                           alt: "#{omniauth_data['provider']} avatar")
        end
      end
    end
  end

  def store_omniauth_data(auth)
    session['devise.omniauth_data'] = auth
  end

  def destroy_omniauth_data
    session['devise.omniauth_data'] = nil
  end

  def omniauth_data
    session['devise.omniauth_data']
  end
end
