Rails.application.routes.draw do
  resources :announcements
  devise_for :users
  resources :users do
    member do
      post 'request_match'    => 'users#request_match'
      post 'accept_match'    => 'users#accept_match'
      put 'read_notification'    => 'users#read_notification'
      put 'stop_following'  => 'users#stop_following'
    end
  end
  resources :matches do
    collection do
      get :index_requested
    end
    resources :match_messages
    resources :warrants, controller: 'matches/warrants'
    member do
      put 'accept_match'    => 'users#accept_match'
    end
  end
  resources :times_messages do
    member do
      put 'like'    => 'times_messages#like'
      put 'unvote'  => 'times_messages#unvote'
    end
    collection do
      get 'users/:user_id' => 'times_messages#users', as: 'users'
      get 'followings' => 'times_messages#followings', as: 'followings'
      get 'images' => 'times_messages#images', as: 'images'
    end
  end
  resources :notifications
  root 'home#index'
  get 'mypages'    => 'mypages#index'
  get 'mypages/show'
  get 'mypages/payment'

  resources :charges
end
