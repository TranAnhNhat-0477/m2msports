Rails.application.routes.draw do
  get "sign_up", to: "registrations#new"
  post "user", to: "registrations#create"
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  root "products#index"
  resource :unsubscribe, only: [ :show ]
end
