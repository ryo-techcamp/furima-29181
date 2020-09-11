class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :family_name, :first_name, :family_kana, :first_kana, :date])
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ryo81' && password == '8119'
    end
  end
end
