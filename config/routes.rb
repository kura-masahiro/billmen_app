Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
     passwords: 'users/passwords'
  }
  devise_scope :user do
    post '/pages/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'pages#index'
  resources :electric_posts do
    member do
      post :like_create
      delete :like_destroy
      get :comment_create
      post :comment_create
      post :comment_destroy
    end
  end

  resources :boil_posts do
    member do
      post :like_create
      delete :like_destroy
      get :comment_create
      post :comment_create
      post :comment_destroy
    end
  end

  resources :freeze_posts do
    member do
      post :like_create
      delete :like_destroy
      get :comment_create
      post :comment_create
      post :comment_destroy
    end
  end

  resources :danger_posts do
    member do
      post :like_create
      delete :like_destroy
      get :comment_create
      post :comment_create
      post :comment_destroy
    end
  end

  resources :build_posts do
    member do
      post :like_create
      delete :like_destroy
      get :comment_create
      post :comment_create
      post :comment_destroy
    end
  end
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
