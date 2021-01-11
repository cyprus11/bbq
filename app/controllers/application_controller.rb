class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :current_user_can_load_photo?
  helper_method :show_subscribe_form?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password])
  end

  def show_subscribe_form?(event)
    !user_signed_in? ||
      user_signed_in? && current_user != event.user && !current_user.subscriptions.pluck(:event_id).include?(event.id)
  end

  def current_user_can_load_photo?(event)
    user_signed_in? && event.subscriptions.map(&:user_email).include?(current_user.email) ||
      event.user == current_user
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def pundit_user
    UserContext.new(current_user, cookies)
  end

  private

  def user_not_authorized
    redirect_to new_user_session_path, alert: t('pundit.event_policy.new?')
  end
end
