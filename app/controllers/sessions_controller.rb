class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        render json: { auth_token: user.generate_token, user_id: user.id }
      else
        render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
      end
    end
  end
  