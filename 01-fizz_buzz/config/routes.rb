Fizzbuzz::Application.routes.draw do
  resources :games, except: [:edit, :destroy] do
    resources :frames, except: [:show, :new]
  end

  devise_for :users, path: :users

 root :to => 'home#show'
end
