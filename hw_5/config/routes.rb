Rails.application.routes.draw do
  root 'posts#index'
  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :authors
  resources :sessions

  resources :posts do
    resources :comments do
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end
    # do
    #   member do
    #     post :publish
    # #  end
    # end
  end
end
