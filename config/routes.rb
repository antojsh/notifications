Rails.application.routes.draw do
  namespace :notifications do
    namespace :v1 do
      resources :users
      resources :packages
      post 'users/login' => 'users#login'
    end
  end
end
