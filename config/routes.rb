Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :users, only: [:show]
  resources :plays do
    resources :playcomments, only: [:create, :destroy]
  end
  resources :recipes do 
    resources :recipecomments, only: [:create, :destroy]
  end
end
