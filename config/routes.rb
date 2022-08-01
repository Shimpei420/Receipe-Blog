Rails.application.routes.draw do
  devise_for :users
    root to: 'posts#index'
    get "search" => "posts#search"
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: :show
end
