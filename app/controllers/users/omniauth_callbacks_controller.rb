class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    auth = request.env['omniauth.auth']
    if current_user
      # 绑定帐号，重定向到设置页面
      connection = current_user.establish_connection(auth)
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: '成功绑定了 Facebook 帐号' }
        format.js { render json: connection, status: 200 }
      end
    else
      # 快捷登录，查找 Connection
      connection = Connection.find_by_omniauth(auth)
      if connection
        # 如果找到，登录并重定向
        flash[:notice] = t('devise.sessions.signed_in')
        sign_in_and_redirect connection.user, event: :authentication
      else
        flash[:alert] = '没有找到绑定的帐号，请注册或登录后绑定服务'
        redirect_to new_user_session_path
      end
    end
  end
end
