Rails.application.routes.draw do
  resources :user_blogs do
      resources :articles do
      end
    end
  get 'user_blogs/index'
  root 'user_blogs#index'
end
