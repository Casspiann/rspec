class Api::V1::SessionsController < ApplicationController
    before_action :authorize_request, except: :create
  
    def create
      @user = User.find_by_email(login_params[:email])
      if @user.present?
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token}, status: :ok
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
    
    
    def destroy
        if current_user.present?
        # Log out the user (clear session, token, etc.)
        # Example: session[:user_id] = nil
        render json: { message: 'Logged out successfully' }, status: :ok
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
    
  
    private
  
    def login_params
      params.permit(:email, :password)
    end
  end
