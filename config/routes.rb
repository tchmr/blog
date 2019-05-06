Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users
  resources :articles do
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  get 'users/:id/favorites' => 'users#favorites'
end
