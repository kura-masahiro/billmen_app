Rails.application.routes.draw do
  get 'freeze_posts/index'
  get 'freeze_posts/show'
  get 'freeze_posts/new'
  get 'freeze_posts/create'
  get 'freeze_posts/edit'
  get 'freeze_posts/update'
  get 'freeze_posts/destroy'
  devise_for :users
  root 'pages#index'
  resources :posts
  resources :electric_posts
  resources :boil_posts
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
