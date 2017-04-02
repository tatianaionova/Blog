Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile', as: 'user_root'

  resources :user_blogs do
      resources :articles do
      end
    end
  get 'user_blogs/index'
  root 'user_blogs#index'
end
