module Omniauthable
  extend ActiveSupport::Concern
  include OmniauthHelper

  protected

  def establish_connection
    auth = omniauth_data.dup if params['auto_connect'] == '1' && omniauth_data

    yield

    flash[:notice] += "成功绑定 #{provider_display_name(auth['provider'])} 帐号。" if current_user&.establish_connection(auth)
  end
end
