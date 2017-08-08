module ConnectionsHelper
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
end
