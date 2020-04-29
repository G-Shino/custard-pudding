Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    member do
      get :favorites
      get :myshops
      get :myreviews
    end
  end
  root to: "toppages#index"
  resources :shops, only: [:index, :show, :new, :create, :destroy]
  resources :reviews, only: [:show, :new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
