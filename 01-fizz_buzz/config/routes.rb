Fizzbuzz::Application.routes.draw do
  devise_for :users, path: :users

 root :to => 'home#show'
end
