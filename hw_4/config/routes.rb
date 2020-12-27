Rails.application.routes.draw do
  root 'posts#index'

  resources :authors
  resources :sessions

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end
end
