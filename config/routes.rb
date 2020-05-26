Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :users, only: [:show]
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
end
