Rails.application.routes.draw do
  resources :fizzs, only: [:index, :show]
  resources :buzzs, only: [:index, :show]
  resources :fizz_buzzs, only: [:index, :show]
end
