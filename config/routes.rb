Rails.application.routes.draw do
  Rails.application.routes.draw do
    post 'signup', to: 'users#create'
    post 'login', to: 'sessions#create'
    get 'profile', to: 'users#profile'
  
    resources :categories, only: [:index, :show, :create, :update, :destroy]
    resources :contents, only: [:index, :show, :create, :update, :destroy]
    resources :comments, only: [:index, :show, :create, :update, :destroy]
    resources :subscriptions, only: [:index, :create, :destroy]
  end
  
end
