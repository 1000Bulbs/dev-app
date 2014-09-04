Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/index'

  get 'isFizz/:val' => 'fizz_buzz#isFizz', :defaults => { :format => 'json' }
  get 'isBuzz/:val' => 'fizz_buzz#isBuzz', :defaults => { :format => 'json' }
  get 'isFizzBuzz/:val' => 'fizz_buzz#isFizzBuzz', :defaults => { :format => 'json' }
end
