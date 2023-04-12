class SubscriptionsController < ApplicationController
    def index
      subscriptions = Subscription.all
      render json: subscriptions
    end
  
    def create
      subscription = Subscription.new(subscription_params)
      subscription.user = current_user
  
      if subscription.save
        render json: subscription
      else
        render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      subscription = Subscription.find(params[:id])
      subscription.destroy
    end
  
    private
  
    def subscription_params
      params.require(:subscription).permit(:category_id)
    end
  end
  