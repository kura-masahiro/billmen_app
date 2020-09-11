Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :electric_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end

  resources :boil_posts, only: [:index, :new, :create] do
    resources :likes, only: [:create, :destroy]
  end
  resources :freeze_posts, only: [:index, :new, :create] do
   resources :likes, only: [:create, :destroy]
  end
  resources :danger_posts, only: [:index, :new, :create] do
    resources :likes, only: [:create, :destroy]
  end
  resources :build_posts, only: [:index, :new, :create] do
   resources :build_likes, only: [:create, :destroy]
  end
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
