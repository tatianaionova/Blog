Rails.application.routes.draw do
  resources :user_blogs do
      resources :articles do
        resources :comments
        end
    end
  get 'welcome/index'
  root 'welcome#index'
end
