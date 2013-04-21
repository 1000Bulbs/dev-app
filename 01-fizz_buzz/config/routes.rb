Fizzbuzz::Application.routes.draw do
  resources :games

  devise_for :users, path: :users

 root :to => 'home#show'
end
