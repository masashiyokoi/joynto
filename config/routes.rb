Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :timelines do
    member do
      put 'like'    => 'timelines#like'
      put 'unvote'  => 'timelines#unvote'
    end
    collection do
      get 'users/:user_id' => 'timelines#users', as: 'users'
      get 'followings' => 'timelines#followings', as: 'followings'
    end
  end
  devise_for :users
  resources :users do
    member do
      put 'follow'    => 'users#follow'
      put 'stop_following'  => 'users#stop_following'
    end
  end
  root 'timelines#index'
  get 'mypages/index'
  get 'mypages/show'
  resources :channels do
    resources :timelines, controller: 'channels/timelines'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
