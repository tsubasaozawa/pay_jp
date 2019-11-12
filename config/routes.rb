Rails.application.routes.draw do
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :products do
    collection do
      post 'pay/:id' => 'products#pay', as: 'pay'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
