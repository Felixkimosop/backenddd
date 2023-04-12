class ApplicationController < ActionController::API
    before_action :authenticate_user
  
    def authenticate_user
      token = request.headers['Authorization']
      user = User.find_by(token: token)
  
      unless user
        render json: { errors: 'Unauthorized' }, status: :unauthorized
      end
    end
  
    def current_user
      token = request.headers['Authorization']
      User.find_by(token: token)
    end
  end
  
