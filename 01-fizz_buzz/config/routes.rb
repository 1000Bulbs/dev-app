Fizzbuzz::Application.routes.draw do
  resources :frames


  resources :games, except: [:edit, :destroy]

  devise_for :users, path: :users

 root :to => 'home#show'
end
