Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :users, only: [:index, :show]
  get "users/:id/myrecipes" => "users#myrecipes"
  get "users/:id/show_plays" => "users#show_plays"
  get "users/:id/show_recipes" => "users#show_recipes"
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
