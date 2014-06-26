Rails.application.routes.draw do

  get 'welcome/readme'

  root 'posts#index'

  devise_for :users

  resources :categories do
    resources :posts
  end

  resources :posts do
    get 'list_my', on: :collection
    get 'archive', on: :collection
    resources :comments
  end

end