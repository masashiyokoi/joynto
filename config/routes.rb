Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :messages do
    member do
      put 'like'    => 'messages#like'
      put 'unvote'  => 'messages#unvote'
    end
    collection do
      get 'users/:user_id' => 'messages#users', as: 'users'
      get 'followings' => 'messages#followings', as: 'followings'
    end
  end
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
  resources :channels do
    resources :messages, controller: 'channels/messages'
  end
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
