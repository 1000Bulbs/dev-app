Rails.application.routes.draw do
  get 'fizzbuzz/fizz'
  root 'fizzbuzz#fizz'
end
