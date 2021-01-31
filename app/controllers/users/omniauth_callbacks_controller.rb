class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth(request: request.env['omniauth.auth'], provider: 'Facebook')
  end

  def vkontakte
    oauth(request: request.env['omniauth.auth'], provider: 'Vkontakte')
  end

  private

  def oauth(args)
    @user = User.find_for_oauth(args[:request])
    provider = args[:provider]

    if @user.persisted?
      flash[:notice] = t('devise.omniauth_callbacks.success', kind: provider)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = t(
        'devise.omniauth_callbacks.failure',
        kind: provider,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end

