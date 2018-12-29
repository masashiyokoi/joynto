Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :timelines do
    member do
      put 'like'    => 'timelines#like'
      put 'unvote'  => 'timelines#unvote'
    end
  end
  resources :users
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
