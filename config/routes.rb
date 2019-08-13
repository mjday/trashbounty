Rails.application.routes.draw do
  get 'collections/index'
  get 'collections/new'
  get 'collections/create'
  get 'banks/index'
  get 'banks/show'
  get 'banks/new'
  get 'banks/create'
  get 'banks/edit'
  get 'banks/update'
  get 'banks/destroy'
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
