Rails.application.routes.draw do
  get 'verification/new'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'

  resources :collections, only: [:index, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :banks do
    resources :verifications, only: [:show, :new, :create]
  end

  get "transaction", to: "collections#transaction", as: :transaction
  post "transaction", to: "collections#validate", as: :validate
  get "dashboard", to: "users#dashboard", as: :users_dashboard
  get "help", to: "pages#help", as: :help
  get "leaderboard", to: "pages#leaderboard", as: :leaderboard
  get "camera", to: "users#camera", as: :users_camera
end
