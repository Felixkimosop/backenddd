class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
  
    def authenticate
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        render json: { token: AuthService.encode(user_id: user.id) }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
  