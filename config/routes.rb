Rails.application.routes.draw do
  get 'electric_posts/index'
  get 'electric_posts/show'
  get 'electric_posts/new'
  get 'electric_posts/create'
  get 'electric_posts/edit'
  get 'electric_posts/update'
  get 'electric_posts/destroy'
  devise_for :users
  root 'pages#index'
  resources :posts
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
