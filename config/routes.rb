Rails.application.routes.draw do
  devise_for :users
  resources :ideas do
    resources :reviews
    member do
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
  end
  root 'ideas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
