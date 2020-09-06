Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  resources :electric_posts
  resources :boil_posts
  resources :freeze_posts
  resources :danger_posts
  resources :build_posts
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
