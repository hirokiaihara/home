Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get "pages/guide" => "pages/guide"
  resources :users, only: [:index, :show]
  resources :notifications, only: [:index]
  delete "notifications/destroy_all" => "notifications#destroy_all"
  get "users/:id/myrecipes" => "users#myrecipes"
  get "users/:id/show_plays" => "users#show_plays"
  get "users/:id/show_recipes" => "users#show_recipes"
  get "users/:id/show_follows" => "users#show_follows"
  get "users/:id/show_followers" => "users#show_followers"
  resources :relationships, only: [:create, :destroy]
  resources :plays do
    resources :playcomments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :recipes do 
    resources :recipecomments, only: [:create, :destroy]
    resource :myrecipes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
