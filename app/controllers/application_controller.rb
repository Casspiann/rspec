class ApplicationController < ActionController::Base
  helper_method :current_user

  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      @current_user ||= User.find_by(authentication_token: token)
    end
  end

  def current_user
    @current_user
  end

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end