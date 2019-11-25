Rails.application.routes.draw do
  resources :purchase, only: [:show] do
    member do
      post :pay
      get :done
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  devise_for :users
  resources :users, only: [:edit, :update] do
    member do
      get :mypage
    end
  end
  resources :products do
  end
  root to: "products#index"
end
