Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'

  resources :banks

  resources :collections, only: [:index, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  get "transaction", to: "collections#transaction", as: :transaction
  post "transaction", to: "collections#validate", as: :validate
  get "dashboard", to: "users#dashboard", as: :users_dashboard
  get "help", to: "pages#help", as: :help
end
