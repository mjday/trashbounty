Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :banks

  resources :collections, only: [:index, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

end
