Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/index'

  get 'fizzBuzz' => 'fizz_buzz#fizzBuzz', :defaults => { :format => 'json' }
end
