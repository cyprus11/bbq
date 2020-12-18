class ApplicationController < ActionController::Base
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
    user_signed_in? && event.subscriptions.pluck(:user_email).include?(current_user.email) ||
      event.user == current_user
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end
end
