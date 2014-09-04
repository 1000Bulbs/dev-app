Rails.application.routes.draw do
  get 'isMultOfThree/:val' => 'fizz_buzz#isMultOfThree', :defaults => { :format => 'json' }
  get 'isMultOfFive/:val' => 'fizz_buzz#isMultOfFive', :defaults => { :format => 'json' }
end
