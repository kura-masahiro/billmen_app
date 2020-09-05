Rails.application.routes.draw do
 
  get 'boil_posts/index'
  get 'boil_posts/show'
  get 'boil_posts/new'
  get 'boil_posts/create'
  get 'boil_posts/edit'
  get 'boil_posts/update'
  get 'boil_posts/destroy'
  devise_for :users
  root 'pages#index'
  resources :posts
  resources :electric_posts
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
