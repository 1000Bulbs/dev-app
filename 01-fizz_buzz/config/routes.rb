Fizzbuzz::Application.routes.draw do
  resources :games, except: [:edit, :destroy] do
    resources :frames
  end

  devise_for :users, path: :users

 root :to => 'home#show'
end
