Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :timelines do
    member do
      put 'like'    => 'timelines#like'
      put 'unvote'  => 'timelines#unvote'
    end
  end
  devise_for :users
  resources :users do
    member do
      put 'follow'    => 'users#follow'
      put 'stop_following'  => 'users#stop_following'
    end
  end
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
