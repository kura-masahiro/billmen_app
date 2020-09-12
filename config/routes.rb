Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :electric_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end

  resources :boil_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end

  resources :freeze_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end

  resources :danger_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end

  resources :build_posts do
    member do
      post :like_create
      delete :like_destroy
    end
  end
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
