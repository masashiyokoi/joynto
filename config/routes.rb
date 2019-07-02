Rails.application.routes.draw do
  resources :emojis
  resources :messages do
    member do
      put 'like'    => 'messages#like'
      put 'unvote'  => 'messages#unvote'
    end
    collection do
      get 'users/:user_id' => 'messages#users', as: 'users'
      get 'followings' => 'messages#followings', as: 'followings'
      get 'images' => 'messages#images', as: 'images'
    end
  end
  get 'users/sign_up', to: 'messages#index'
  devise_for :users
  resources :users do
    member do
      put 'follow'    => 'users#follow'
      put 'stop_following'  => 'users#stop_following'
    end
  end
  root 'messages#index'
  get 'mypages/index'
  get 'mypages/show'
  namespace :channel do
    resources :directs do
      resources :messages, controller: 'directs/messages'
    end
  end
  resources :comments
  resource :corporate
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
