Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :categories
  resources :posts do
    get 'list_my', on: :collection
    resources :comments
  end

end