# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json

  before_action :underscore_params!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden }
    end
  end

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end

  def signed_in?
    current_user.present?
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_user
    return if request.headers['Authorization'].blank?

    authenticate_or_request_with_http_token do |token|
      jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

      @current_user_id = jwt_payload['id']
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      head :unauthorized
    end
  end
end
