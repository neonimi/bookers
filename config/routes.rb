Rails.application.routes.draw do


  devise_for :users	
  resources :users,only:[:show, :index, :edit, :update]
  # root to: 'home#top'
  get 'home/about' => 'home#about'

  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  root'books#index'

  root 'users#index'
  resources :users, only: [:show, :index] do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
end
