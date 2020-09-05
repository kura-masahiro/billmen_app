Rails.application.routes.draw do
  get 'danger_posts/index'
  get 'danger_posts/show'
  get 'danger_posts/new'
  get 'danger_posts/create'
  get 'danger_posts/edit'
  get 'danger_posts/update'
  get 'danger_posts/destroy'
  devise_for :users
  root 'pages#index'
  resources :posts
  resources :electric_posts
  resources :boil_posts
  resources :freeze_posts
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
