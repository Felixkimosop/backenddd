class UsersController < ApplicationController
    def create
      user = User.new(user_params)
  
      if user.save
        render json: { auth_token: user.generate_token, user_id: user.id }
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def profile
      render json: current_user, serializer: UserSerializer, status: :ok
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  