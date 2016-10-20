Rails.application.routes.draw do
  
  namespace :notifications do
    namespace :v1 do
      resources :users
      resources :packages
      resources :services
      post 'message/send/email' , to: 'notifications#send_message'
      post 'message/send/sms' , to: 'notifications#send_sms'
      post 'message/send/push' , to: 'notifications#send_message'
      resources :messages , controller: 'notifications'
      post 'users/login' => 'users#login'
      resources :servicepackages, controller: 'service_packages'
    end
  end
end
