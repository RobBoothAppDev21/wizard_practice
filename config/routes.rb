Rails.application.routes.draw do
  get 'chats/show'
  get 'chats/create'
  devise_for :users

  authenticated :user do
    root to: "chats#index", as: :authenticate_user_root
  end

  resources :messages, only: %i[create]

  devise_scope :user do
    root to: "static#index"
  end

  resources :chats, only: %i[index create show destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
