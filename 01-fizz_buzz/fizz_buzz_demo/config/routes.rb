Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'fizz-buzz', to: "fizz_buzz#index", defaults: { format: 'json' }
    end
  end
end
